# Azure Files
# fully managed file share service in Azure that provides SMB (Server Message Block) and NFS-based shared storage
# it allows multiple VMs and services to access the same files simultaneously
#   - NTFS ACLs for permission menagament

# Protocols:
#   - SMB 3.1.1: Windows/Linux VM network shares, hybrid access from on-prem
#   - NFS 4.1: Linux VM workloads requiring NFS support
#   - REST API: programmatic file storage for applications
#   - Azure File Sync: sync on-prem Windows file shares with Azure

# Types of replication:
#   - LRS (Locally Redundant Storage): 3 copies within a single data center
#   - ZRS (Zone Redundant Storage): 3 copie across different Availability Zones
#   - GRS (Geo Redundant Storage): 6 copies (3 in primary region, 3 in secondary region)
#   - RA-GRS (Read Access GRS): same as GRS but in secondary region only readable

resource "azurerm_storage_account" "example" {
  name                     = "azureteststorage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "example" {
  name               = "sharename"
  storage_account_id = azurerm_storage_account.example.id
  quota              = 50

  acl {
    id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"

    access_policy {
      permissions = "rwdl"
      start       = "2019-07-02T09:38:21Z"
      expiry      = "2019-07-02T10:38:21Z"
    }
  }
}

resource "azurerm_private_endpoint" "example" {
  name                = "files-private-endpoint"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "privatelink-files"
    private_connection_resource_id = azurerm_storage_account.example.id
    subresource_names              = ["file"]  # private endpoint for Azure Files
    is_manual_connection           = false
  }
}

# Mount on Windows (SMB):
# $storageAccountKey = "<STORAGE_ACCOUNT_KEY>"
# $storageAccountName = "storagefilesexample"
# $shareName = "file-share"
# net use Z: \\$storageAccountName.file.core.windows.net\$shareName /u:$storageAccountName $storageAccountKey

# Mount on Linux (SMB):
# sudo mkdir /mnt/azurefiles
# sudo mount -t cifs //storagefilesexample.file.core.windows.net/file-share /mnt/azurefiles \
#   -o vers=3.0,username=storagefilesexample,password=<STORAGE_ACCOUNT_KEY>,dir_mode=0777,file_mode=0777
