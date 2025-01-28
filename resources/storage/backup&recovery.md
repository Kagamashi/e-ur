# Implement Backup and Recovery for Storage

## Configuring **Azure Backup** for Storage Accounts

### Setting Backup Policies
- Define backup frequency (daily, weekly) and retention settings.
- Configure backup policies using the **Azure Portal** or **PowerShell**.

**Example PowerShell Command:**
```powershell
Set-AzRecoveryServicesBackupProtectionPolicy -PolicyName "DailyBackupPolicy" -RetentionRangeInDays 30
```

### Scheduling and Managing Backups
- Automate backups by creating schedules for storage account data.
- Manage and monitor backups using the **Azure Backup Center**.

### Retention and Recovery Options
- Specify retention periods for short-term and long-term backups.
- Use **Azure Recovery Services Vault** for centralized backup and recovery management.

## Implementing Soft Delete for Blobs and File Shares

### Configuring Retention Periods
- Enable **soft delete** for blobs and file shares to retain deleted data for a specified period.
- Configure retention periods between 1 and 365 days.

**Example Azure CLI Command:**
```bash
az storage blob service-properties delete-policy update --account-name <storage_account> --days 7
```

### Restoring Soft-Deleted Data
- Recover soft-deleted blobs and files directly from the Azure Portal or CLI.

**Example Azure CLI Command to Restore Blobs:**
```bash
az storage blob undelete --container-name <container> --name <blob_name> --account-name <storage_account>
```

## Recovery Options

### Restoring from Snapshots
- Use blob snapshots to restore data to a previous state.

**Example Azure CLI Command:**
```bash
az storage blob snapshot restore --container-name <container> --name <blob_name> --snapshot <snapshot_time>
```

### Recovering Deleted Blobs and Files
- Recover deleted blobs and files using the soft delete feature.
- Navigate to the **Blob Containers** section in the Azure Portal to restore deleted items.

### Restoring Storage Account Data Using Azure Backup
- Initiate restores from the **Azure Backup Center**.
- Choose recovery points based on backup policies and retention settings.

**Example Steps:**
1. Open **Azure Backup Center**.
2. Select the relevant Recovery Services Vault.
3. Initiate the **Restore** operation and follow the prompts to recover the data.

