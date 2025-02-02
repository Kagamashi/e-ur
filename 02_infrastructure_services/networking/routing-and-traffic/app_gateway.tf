# Layer 7 (HTTP/HTTPS) load balancer.
# recommended for Web Applications, APIs

# Features:
# - SLL Termination & End-to-End SSL
# - Web Application Firewall (WAF)
#     protects against SQL injection, XSS, DDoS attacks
#     supports OWASP Core Rule Set (CRS)
#     runs in detection or prevention mode
# - Routes traffic using URL-based and host-based rules
#     URL path (e.g., /api → API servers, /static → CDN)
#     Host header (e.g., app1.contoso.com → Backend1, app2.contoso.com → Backend2).
# - Autoscaling & Zone Redundancy

# Best practices:
#   - enable WAF in prevention mode
#   - redirect HTTP to HTTPS
#   - use custom domain names and certificates for SSL security
#   - configure health probes to detect unhealthy instances
#   - enable connection draining to allow graceful shutdowns

resource "azurerm_public_ip" "example" {
  name                = "example-pip"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
}

# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${azurerm_virtual_network.example.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.example.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.example.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.example.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.example.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.example.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.example.name}-rdrcfg"
}

resource "azurerm_application_gateway" "network" {
  name                = "example-appgateway"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  sku {
    name     = "Standard_v2" # || Basic || WAF_v2
    tier     = "Standard_v2" # WAF_v2 sku enables Web Application Firewall (WAF)
    capacity = 2
  }

  autoscale_configuration {
    min_capacity = 2
    max_capacity = 5
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.example.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.example.id
  }

  backend_address_pool { # targets VMs or App Services
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener { # handles incoming requests
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule { # direct traffic to backend
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  # Web Application Firewall (WAF) configuration enabled in Prevention mode
  waf_configuration {
    enabled          = true
    firewall_mode    = "Prevention"  # Blocks malicious traffic
    rule_set_type    = "OWASP"
    rule_set_version = "3.2"  # OWASP Core Rule Set version
    # policy_id = azurerm_web_application_firewall_policy.waf.id    # reference to apply WAF policies and rules
  }
}
