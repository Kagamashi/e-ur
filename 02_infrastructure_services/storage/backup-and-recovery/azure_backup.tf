# Azure Backup
# cloud-based backup service that enables secure, scalable, and centralized data protection for on-premises and Azure workloads

# Supported backup scenarios:
# - On-premises: 
# - Azure VMs: Full VM, Managed Disks
# - Azure File Shares
# - Databases: SQL Server, SAP HANA, PostgreSQL, MySQL
# - Storage: Azure Blobs
# - Containers: AKS

# Key features:
# - zero-infrastructure backup: no backup server or infrastructure required
# - centralized backup management: backup center
# - security: built-in security for data in transit and at rest

# Recovery Time Objective [RTO]: defines how quickly data mu be restored after a failure (max downtime allowed 4h = RTO eq 4h)
# Recovery Point Objective [RPO]: 

# Types of replication:
#   - LRS (Locally Redundant Storage): 3 copies within a single data center
#   - ZRS (Zone Redundant Storage): 3 copie across different Availability Zones
#   - GRS (Geo Redundant Storage): 6 copies (3 in primary region, 3 in secondary region)

resource "azurerm_recovery_services_vault" "example" {
  name                = "tfex-recovery-vault"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
}

resource "azurerm_backup_policy_vm" "example" {
  name                = "tfex-recovery-vault-policy"
  resource_group_name = azurerm_resource_group.example.name
  recovery_vault_name = azurerm_recovery_services_vault.example.name

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 10
  }

  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }

  retention_yearly {
    count    = 77
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
}

# view backup jobs
# az backup job list --resource-group rg-backup --vault-name backup-vault --query "[].{Status:status, VM:properties.entityFriendlyName, StartTime:startTime}" --output table

# restore vm from backup
# az backup restore restore-disks --resource-group rg-backup --vault-name backup-vault --container-name myvm --item-name myvm --target-resource-group my-rg --storage-account mysa --restore-type Original
