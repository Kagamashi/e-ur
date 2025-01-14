# Monitor and Manage Access

## Configure and Review Resource Locks

### Creating Resource Locks

Azure resource locks help prevent accidental deletion or modification of resources. There are two types of locks:

1. **Read-Only**:
   - Prevents modifications to the resource.
   - Users can still read and list information, but actions like updates or deletes are blocked.

2. **Delete**:
   - Prevents resource deletion while allowing modifications.

#### Steps to Create a Resource Lock (Azure Portal):
1. Navigate to the **Azure Portal**.
2. Select the resource, resource group, or subscription you want to lock.
3. Under the **Settings** section, select **Locks**.
4. Click **+ Add** to create a new lock.
5. Provide the following details:
   - **Lock Name**: A descriptive name for the lock.
   - **Lock Type**: Choose between **Read-Only** or **Delete**.
   - **Notes** (optional): Additional information about the lock.
6. Click **OK** to apply the lock.

#### Using Azure CLI:
```bash
az lock create \
  --name <lock_name> \
  --resource-group <resource_group_name> \
  --resource-name <resource_name> \
  --resource-type <resource_type> \
  --lock-type <ReadOnly|CanNotDelete>
```

#### Using PowerShell:
```powershell
New-AzResourceLock -LockLevel <ReadOnly|CanNotDelete> -LockName <lock_name> -ResourceGroupName <resource_group_name> -ResourceName <resource_name> -ResourceType <resource_type>
```

### Managing and Removing Locks

#### Viewing Locks:
- **Azure Portal**:
  - Navigate to the resource.
  - Under **Settings**, select **Locks** to view existing locks.

- **Azure CLI**:
  ```bash
  az lock list --resource-group <resource_group_name>
  ```

- **PowerShell**:
  ```powershell
  Get-AzResourceLock -ResourceGroupName <resource_group_name>
  ```

#### Removing Locks:
- **Azure Portal**:
  1. Go to the **Locks** section of the resource.
  2. Select the lock to remove and click **Delete**.

- **Azure CLI**:
  ```bash
  az lock delete \
    --name <lock_name> \
    --resource-group <resource_group_name>
  ```

- **PowerShell**:
  ```powershell
  Remove-AzResourceLock -LockName <lock_name> -ResourceGroupName <resource_group_name>
  ```

### Understanding the Impact of Locks on Resources

1. **Read-Only Lock**:
   - Prevents actions like updates, moves, and deletes.
   - Applies to all users, including administrators.
   - Example: A virtual machine with a read-only lock cannot be started, stopped, or modified but can be viewed.

2. **Delete Lock**:
   - Prevents deletion of the resource.
   - Allows updates and modifications.
   - Example: A storage account with a delete lock can have its settings modified but cannot be deleted.

### Best Practices
- Use **Delete Locks** to safeguard critical resources from accidental deletion.
- Apply **Read-Only Locks** to resources that require strict configurations, such as production databases.
- Regularly review locks to ensure they align with your operational needs.

