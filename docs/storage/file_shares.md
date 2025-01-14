# Manage Blob Storage, File Shares, and Security

## Blob Storage

### Creating and Managing Blob Containers
- Use Azure Portal, CLI, PowerShell, or ARM templates to create blob containers.
- Manage blobs within containers using tools like Azure Storage Explorer.

**Example Azure CLI Command:**
```bash
az storage container create --name <container_name> --account-name <storage_account_name>
```

### Managing Blob Lifecycle with Azure Blob Storage Lifecycle Management Policies
- Use lifecycle policies to automate blob tier transitions and deletions.
- Configure rules to move blobs to Cool or Archive tiers based on last modified date.

**Example Policy JSON:**
```json
{
  "rules": [
    {
      "enabled": true,
      "name": "move-to-cool",
      "type": "Lifecycle",
      "definition": {
        "filters": {
          "blobTypes": ["blockBlob"],
          "prefixMatch": ["container1/"]
        },
        "actions": {
          "baseBlob": {
            "tierToCool": {
              "daysAfterModificationGreaterThan": 30
            }
          }
        }
      }
    }
  ]
}
```

### Versioning, Soft Delete, and Change Feed
- **Versioning**: Keeps previous versions of blobs.
- **Soft Delete**: Protects against accidental deletion by retaining deleted blobs for a configurable period.
- **Change Feed**: Provides a log of changes made to blobs.

**Example CLI Command to Enable Soft Delete:**
```bash
az storage blob service-properties delete-policy update --account-name <storage_account_name> --enable true --days-retained 7
```

### Blob Access Levels
- **Private**: Only the owner has access.
- **Blob**: Public read access to blobs.
- **Container**: Public read access to blobs and container metadata.

**Example CLI Command to Set Access Level:**
```bash
az storage container set-permission --name <container_name> --public-access <access_level>
```

### Immutable Storage
- Protects data by preventing deletion or modification for a specified period.
- Use legal holds or time-based retention policies.

**Example CLI Command to Set Legal Hold:**
```bash
az storage container legal-hold set --account-name <storage_account_name> --container-name <container_name> --tags <tag1,tag2>
```

---

## File Shares

### Creating and Managing Azure Files
- Create file shares via the Azure Portal, CLI, or PowerShell.
- Manage file shares using Azure File Sync or directly via SMB or NFS protocols.

**Example CLI Command:**
```bash
az storage share create --name <share_name> --account-name <storage_account_name>
```

### Configuring File Share Quotas
- Set a quota to limit the storage capacity of a file share.

**Example CLI Command:**
```bash
az storage share update --name <share_name> --account-name <storage_account_name> --quota <quota_in_gb>
```

### Connecting Azure File Shares to On-Premises Environments
- Use SMB or NFS protocols to mount Azure File shares.
- Install Azure File Sync agent for synchronization.

**Example Mount Command (Linux):**
```bash
sudo mount -t cifs //<storage_account_name>.file.core.windows.net/<share_name> /mnt/<mount_point> -o vers=3.0,username=<storage_account_name>,password=<storage_account_key>,dir_mode=0777,file_mode=0777
```

---

## Security

### Managing Azure Storage Firewalls and Virtual Network Rules
- Restrict access by allowing only specific IP addresses or virtual networks.

**Example CLI Command:**
```bash
az storage account network-rule add --resource-group <resource_group> --account-name <storage_account_name> --ip-address <ip_address>
```

### Encryption Options
- **Server-Side Encryption (SSE)**: Choose between Microsoft-managed keys, customer-managed keys, or double encryption.
- **Client-Side Encryption**: Encrypt data before uploading it to Azure Storage.

**Example CLI Command to Enable SSE with Customer-Managed Keys:**
```bash
az storage account update --name <storage_account_name> --resource-group <resource_group> --encryption-services blob --encryption-key-source Microsoft.Keyvault --key-name <key_name> --key-vault <key_vault_uri>
```

### Azure Role-Based Access Control (RBAC) for Storage
- Assign roles like Storage Blob Data Reader or Storage Account Contributor to manage permissions.

**Example CLI Command:**
```bash
az role assignment create --assignee <user_or_group_id> --role "Storage Blob Data Reader" --scope <storage_account_id>
```

### Storage Shared Key Access and SAS Tokens
- **Shared Key Access**: Use the account key to authenticate.
- **Shared Access Signatures (SAS)**: Generate limited-time access tokens for specific operations.

**Example CLI Command to Generate SAS Token:**
```bash
az storage account generate-sas --account-name <storage_account_name> --expiry <expiry_time> --permissions rwdlacup --resource-types sco --services bfqt
```

### Enabling Advanced Threat Protection (ATP) for Storage
- Detects unusual and potentially harmful attempts to access or exploit storage accounts.

**Example CLI Command:**
```bash
az storage account update --name <storage_account_name> --resource-group <resource_group> --enable-advanced-threat-protection true
```

