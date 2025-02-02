# DNS (Domain Name System) translates domain names
  # A	: domain to an IPv4 address	: example.com → 192.168.1.1
  # AAAA : domain to an IPv6 address : example.com → 2001:db8::1
  # CNAME : alias one domain to another	: www.example.com → example.com
  # MX : mail server settings	: example.com → mail.example.com
  # TXT	: stores text data for verification	: SPF, DKIM, etc.


# Private DNS
#   - resolve private domains inside Azure
#   - NO internet required (internal for Azure)-
#   - used for private endpoints, VMs in VNETs

resource "azurerm_private_dns_zone" "private_zone" {
  name                = "privatedb.local"
  resource_group_name = azurerm_resource_group.dns.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = "example-dns-link"
  resource_group_name   = azurerm_resource_group.dns.name
  private_dns_zone_name = azurerm_private_dns_zone.private_zone.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}
# adds A record: database.privatedb.local → 10.0.1.5
resource "azurerm_private_dns_a_record" "db" {
  name                = "database"
  zone_name           = azurerm_private_dns_zone.private_zone.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 300
  records             = ["10.0.1.5"]
}

###

# Azure DNS
#   - resolves public domain
#   - internet required
#   - used for websites, external-facing apps 

resource "azurerm_dns_zone" "example" {
  name                = "example.com"
  resource_group_name = azurerm_resource_group.dns.name
}

# adds A record: www.example.com -> 52.23.45.67
resource "azurerm_dns_a_record" "web" {
  name                = "www"
  zone_name           = azurerm_dns_zone.example.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 300
  records             = ["52.23.45.67"]
}
