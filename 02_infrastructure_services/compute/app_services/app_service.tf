# Azure App Service
# fully managed platform for hosting web applications, REST APIs, mobile backends

#   - runs applications in Docker containers
#   - supports HTTPS, Azure Front Door, Application Gateway
#   - manual and auto-scaling based on parameters
#   - CI/CD integration: GitHub, Bitbucket, Azure DevOps
#   - multiple language support: .NET, Java, Node.js, Python, PHP, Ruby

# Azure App Service Plans:
#   Free (F1) - 1GB memory, no custom domains
#   Basic (B1-B3) - 10-100GB storage, custom domains, auto-scale
#   Standard (S1-S3) - 50-250GB storage, staging slots
#   Premium (P1-P3, P1V2-P3V2..) - traffic routing, isolated VMs
#   Isolated (I1-I3) - dedicated VNET

resource "azurerm_app_service_plan" "example" {
  name                = "appservice-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"  # Linux-based App Service
  reserved            = true

  sku {
    tier = "PremiumV2"
    size = "P1v2"  # 1 vCPU, 3.5 GB RAM
  }
}

resource "azurerm_linux_web_app" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}

# GitHub Deployment
resource "azurerm_app_service_source_control" "example" {
  app_id                 = azurerm_app_service.example.id
  repo_url               = "https://github.com/your-repo/webapp"
  branch                 = "main"
  rollback_enabled       = false
  use_manual_integration = true
}

# private endpoint for App Service (disables public internet access)
resource "azurerm_private_endpoint" "example" {
  name                = "webapp-private-endpoint"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "webapp-private-link"
    private_connection_resource_id = azurerm_app_service.example.id
    is_manual_connection           = false
  }
}

# allows app to securely commmunicate with databases inside Azure VNET
resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  app_service_id = azurerm_app_service.example.id
  subnet_id      = azurerm_subnet.example.id
}
