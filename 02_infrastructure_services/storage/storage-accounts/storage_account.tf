# Azure Storage Account
# container for storing blobs, files, queues, tables
# provides scalability, durability, high availability while supporting different storage tiers

# Types of storage:
#   - Blob Storage: object storage for unstructured data
#   - File Storage: fully managed SMB/NFS file shares
#   - Queue Storage: asynchronous messaging service
#   - Table Storage: NoSQL key-value storage

# Types of replication:
#   - LRS (Locally Redundant Storage): 3 copies within a single data center
#   - ZRS (Zone Redundant Storage): 3 copie across different Availability Zones
#   - GRS (Geo Redundant Storage): 6 copies (3 in primary region, 3 in secondary region)
#   - RA-GRS (Read Access GRS): same as GRS but in secondary region only readable
#   - GZRS (Geo Zone Redundant Storage): combines ZRS + GRS for best resillience
#       data is copied in primary region using ZRS, in secondary region using LRS

resource "azurerm_storage_account" "example" {
  name                = "storageaccountname"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "example"
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}

resource "azurerm_storage_container_immutability_policy" "example" {
  storage_container_resource_manager_id = azurerm_storage_container.example.resource_manager_id
  immutability_period_in_days           = 14
  protected_append_writes_all_enabled   = false
  protected_append_writes_enabled       = true
}
