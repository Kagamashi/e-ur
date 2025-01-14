# **Create and Configure Storage Accounts**

## **Types of Storage Accounts**

1. **StorageV2** (General Purpose v2):
   - Supports blob, file, queue, and table storage.
   - Offers all performance tiers and replication options.
   - Recommended for most scenarios.

2. **BlobStorage**:
   - Optimized for unstructured data storage (e.g., images, videos).
   - Supports access tiers (Hot, Cool, Archive).

3. **FileStorage**:
   - Premium performance tier optimized for Azure Files.
   - Provides SMB and NFS protocols for file shares.

---

## **Configuring Account Options**

### **Performance Tiers**

- **Standard**: Cost-effective storage for general-purpose workloads.
  - Suitable for infrequently accessed data.
  - Supports all replication options except RA-GZRS.

- **Premium**: High-performance storage for low-latency applications.
  - Suitable for I/O-intensive workloads (e.g., databases).
  - Supports LRS and ZRS replication.

### **Access Tiers**

- **Hot**: Frequent access.
  - Higher storage cost, lower access cost.

- **Cool**: Infrequent access.
  - Lower storage cost, higher access cost.
  - Minimum storage duration: 30 days.

- **Archive**: Rare access.
  - Lowest storage cost, highest access cost.
  - Minimum storage duration: 180 days.

### **Replication Options**

1. **Locally Redundant Storage (LRS)**:
   - 3 copies within a single region.
   - Least expensive option.

2. **Zone-Redundant Storage (ZRS)**:
   - 3 copies across different availability zones in the same region.
   - Higher availability and resiliency.

3. **Geo-Redundant Storage (GRS)**:
   - LRS with secondary copy in another region.
   - Provides disaster recovery.

4. **Read-Access Geo-Redundant Storage (RA-GRS)**:
   - GRS with read access to secondary region.

5. **Geo-Zone-Redundant Storage (GZRS)**:
   - ZRS with a secondary copy in another region.
   - Combines ZRS and GRS benefits.

6. **Read-Access Geo-Zone-Redundant Storage (RA-GZRS)**:
   - GZRS with read access to secondary region.

### **Minimum TLS Version**

- Specifies the lowest supported version of TLS.
- Recommended: `TLS1_2`.

### **Hierarchical Namespace**

- Enables **Azure Data Lake Storage Gen2** features for big data analytics.
- Allows file and directory structures within blob storage.
- Increases efficiency for large-scale data processing.

---

## **Configuring Advanced Settings**

### **Public Access**

- Control whether data in the storage account is publicly accessible.
- Recommended: Disable public access unless necessary.

### **Azure AD Integration**

- Provides enhanced security for access control.
- Supports RBAC for data plane operations (e.g., reading blobs).

### **Shared Access Signatures (SAS)**

- Grants limited access to storage account resources.
- Specify:
  - Permissions (e.g., read, write).
  - Expiry time.
  - IP restrictions.

---

## **Tools for Managing Storage Accounts**

### **Azure Portal**

- GUI for creating and managing storage accounts.
- Step-by-step wizards and monitoring tools.

### **Azure CLI**

- Command-line tool for automation and scripting.

**Example:**
```bash
az storage account create \
  --name mystorageaccount \
  --resource-group myResourceGroup \
  --location westeurope \
  --sku Standard_LRS
```

### **PowerShell**

- Ideal for Windows-based automation and scripting.

**Example:**
```powershell
New-AzStorageAccount -ResourceGroupName "myResourceGroup" -Name "mystorageaccount" -SkuName "Standard_LRS" -Location "westeurope"
```

### **ARM Templates**

- Declarative approach for infrastructure as code.
- Define resources in JSON format.

**Example:**
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "apiVersion": "2021-02-01",
      "name": "mystorageaccount",
      "location": "westeurope",
      "sku": {
        "name": "Standard_LRS"
      },
      "kind": "StorageV2",
      "properties": {}
    }
  ]
}
```

### **Terraform**

- Infrastructure as code tool for multi-cloud environments.

**Example:**
```hcl
resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount"
  resource_group_name      = "myResourceGroup"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

