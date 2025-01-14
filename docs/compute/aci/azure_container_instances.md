# Deploy Azure Container Instances (ACI)

## Use Cases for ACI
- **Simple Container Deployments**: Ideal for running single-container applications quickly without managing infrastructure.
- **Stateless Workloads**: Temporary or burst workloads such as data processing or CI/CD tasks.
- **Dev/Test Environments**: Quick testing and development of containerized applications.
- **Event-Driven Workloads**: Running containers triggered by specific events like messages in a queue.

## Creating and Managing ACI Instances

### Creating ACI via Azure CLI
```bash
az container create \
  --resource-group <resource_group_name> \
  --name <container_name> \
  --image <image_name> \
  --cpu 1 \
  --memory 1.5 \
  --restart-policy OnFailure
```

### Managing ACI Instances
- **List Instances**:
  ```bash
  az container list --output table
  ```
- **Show Details of an Instance**:
  ```bash
  az container show --name <container_name> --resource-group <resource_group_name>
  ```
- **Delete an Instance**:
  ```bash
  az container delete --name <container_name> --resource-group <resource_group_name>
  ```

## Networking Configurations for ACI

### Virtual Network (VNet) Integration
- Integrate ACI with a virtual network to enable secure communication with other Azure resources.
- **Creating ACI with VNet Integration**:
  ```bash
  az container create \
    --resource-group <resource_group_name> \
    --name <container_name> \
    --image <image_name> \
    --vnet <vnet_name> \
    --subnet <subnet_name>
  ```
- Use cases include accessing databases, internal APIs, or securely communicating with on-premises networks via VPN.

## Persistent Storage Options for ACI

### Azure Files
- Attach Azure File shares to containers to persist data beyond the container lifecycle.
- **Mount Azure File Share**:
  ```bash
  az container create \
    --resource-group <resource_group_name> \
    --name <container_name> \
    --image <image_name> \
    --azure-file-volume-share-name <share_name> \
    --azure-file-volume-account-name <storage_account_name> \
    --azure-file-volume-mount-path /mnt/volume
  ```

### Managed Disks
- Attach managed disks for scenarios requiring block storage.
- Use custom scripts to configure managed disk mounting in the container runtime.

## Logging and Monitoring for Container Instances

### Enabling Logs
- View container logs to troubleshoot and monitor.
  ```bash
  az container logs --name <container_name> --resource-group <resource_group_name>
  ```

### Monitoring with Azure Monitor
- Use **Azure Monitor** and **Log Analytics** to collect and analyze metrics and logs.
- **Enable Diagnostics**:
  ```bash
  az monitor diagnostic-settings create \
    --resource <container_instance_id> \
    --workspace <log_analytics_workspace_id> \
    --logs '[{"category": "ContainerInstanceLogs", "enabled": true}]'
  ```

