# Deploy and Manage Azure Kubernetes Service (AKS) Clusters

## Understanding AKS Architecture
- **Control Plane**: Managed by Azure, responsible for scheduling and managing the Kubernetes API server.
- **Node Pools**: VMs that run your containerized applications.
- **Kubernetes Components**:
  - API Server
  - etcd (key-value store)
  - Scheduler
  - Controller Manager

## Creating AKS Clusters
### Using Azure CLI
```bash
az aks create \
  --resource-group <resource_group> \
  --name <aks_cluster_name> \
  --node-count 3 \
  --enable-addons monitoring \
  --generate-ssh-keys
```

### Using Azure Portal
1. Navigate to **Azure Kubernetes Service**.
2. Click **Create**.
3. Configure the basics (resource group, cluster name, region).
4. Set node pool size and VM type.
5. Review and create.

### Using Terraform
```hcl
resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
```

## Configuring Node Pools
- **Scaling**: Adjust the number of nodes to handle workload changes.
- **Upgrading**: Update Kubernetes version for new features and security patches.
- **Auto-scaling**: Enable automatic scaling of nodes based on resource usage.

### Enable Auto-scaling via CLI
```bash
az aks nodepool update \
  --resource-group <resource_group> \
  --cluster-name <aks_cluster_name> \
  --name <node_pool_name> \
  --enable-cluster-autoscaler \
  --min-count 1 \
  --max-count 5
```

## Networking in AKS

### Kubenet vs. Azure CNI
- **Kubenet**:
  - Simpler setup.
  - Uses Azure-provided NAT for outbound traffic.
  - Limited to smaller clusters.

- **Azure CNI**:
  - Provides IPs from Azure VNet for each pod.
  - Suitable for large-scale clusters.

### Configuring Ingress Controllers
- Use NGINX or Application Gateway as ingress.
- Example NGINX setup:
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
```

## Monitoring AKS with Azure Monitor and Log Analytics
- Enable **container insights** to monitor cluster health and performance.
- Analyze logs using **Log Analytics** workspace.

### Enabling Monitoring via CLI
```bash
az aks enable-addons \
  --resource-group <resource_group> \
  --name <aks_cluster_name> \
  --addons monitoring \
  --workspace-resource-id <log_analytics_workspace_resource_id>
```

### Sample KQL Query for Log Analytics
```kql
ContainerInsights
| where ClusterName == "<aks_cluster_name>"
| summarize count() by Computer, ContainerName
```

## Security

### Enabling Azure AD Integration
- Simplifies authentication for AKS.
- Allows integration with Azure RBAC.

```bash
az aks update \
  --resource-group <resource_group> \
  --name <aks_cluster_name> \
  --enable-aad \
  --aad-admin-group-object-ids <group_object_id>
```

### Using Role-Based Access Control (RBAC) in AKS
- Define roles and permissions for accessing cluster resources.
- Example: Assigning the `cluster-admin` role.

```bash
kubectl create clusterrolebinding <binding_name> \
  --clusterrole=cluster-admin \
  --user=<user_principal_name>
```

