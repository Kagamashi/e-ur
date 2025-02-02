# AZURE VIRTUAL NETWORK
# SUBNET segment virtual network into subnetworks
# PEERING connect multiple VNets across different regions (traffic goes through Azure backbone)

#   /16 for large VNets (65,536 IPs), /24 for subnets (256 IPs)(avoid /30 and /31)
#   avoid overlapping IP ranges
#   private IPs inside VNets, public IPs for internet connectivity (# Azure does not support public IP addresses inside a VNet for private communication)
#   Azure requires certain subnets for specific resources: GatewaySubnet, AzureBastionSubnet, AzureFirewallSubnet

# Azure VNets use private IPv4 addressing from the following RFC 1918 address spaces:
#   10.0.0.0/8 (10.0.0.0 – 10.255.255.255)
#   172.16.0.0/12 (172.16.0.0 – 172.31.255.255)
#   192.168.0.0/16 (192.168.0.0 – 192.168.255.255)

# Azure-Reserved Addresses: first four and last IPs in every subnet are reserved:
#   .0 → Network address
#   .1 → Azure Gateway
#   .2 → Azure DHCP
#   .3 → Future use
#   .255 → Broadcast
# eq. for subnet 10.0.1.0/24 the available IPs are 10.0.1.4 – 10.0.1.254 (251 usable IPs)

resource "azurerm_virtual_network" "vnet_hub" {
  name                = var.hub_vnet
  resource_group_name = azurerm_resource_group.rg_hub.name
  location            = "westeurope"
  address_space       = "10.0.0.0/16"
}

resource "azurerm_virtual_network" "vnet_p" {
  name                = "prod_vnet"
  resource_group_name = azurerm_resource_group.rg_p.name
  location            = "westeurope"
  address_space       = "10.2.0.0/16"
}

resource "azurerm_subnet" "example" {
  name                 = "prod_db"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vnet_p.name
  address_prefixes     = "10.2.1.0/24"
  service_endpoints    = "Microsoft.Sql" # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#service_endpoints-1:~:text=Link%20Services.-,service_endpoints,-%2D%20(Optional)%20The%20list

  delegation {
    name = "delegation" # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#:~:text=A-,service_delegation,-block%20supports%20the

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

resource "azurerm_virtual_network_peering" "peering_p_to_hub" {
  name                      = "peer_${azurerm_virtual_network.vnet_p.name}_to_${azurerm_virtual_network.vnet_hub.name}"
  remote_virtual_network_id = azurerm_virtual_network.vnet_hub.id
  resource_group_name       = azurerm_virtual_network.vnet_p.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet_p.name
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "peering_hub_to_p" {
  name                      = "peer${azurerm_virtual_network.vnet_hub.name}_to_${azurerm_virtual_network.vnet_p.name}"
  remote_virtual_network_id = azurerm_virtual_network.vnet_p.id
  resource_group_name       = azurerm_virtual_network.vnet_hub.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet_hub.name
  allow_forwarded_traffic   = true
}

variable "hub_vnet" {
  type        = string
  default     = "hub_vnet"
  description = "The address prefix for the hub virtual network"

  validation {
    condition     = can(regex("^[0-9]+[.][0-9]+[.][0-9]+[.][0-9]+/[0-9]+$", var.hub_vnet))
    error_message = "invalid hub_vnet: validation failed"
  }
}
