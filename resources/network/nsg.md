## **Implement Network Security Groups (NSGs)**

### **Understanding NSGs**

- **Purpose of NSGs**:
  - NSGs are a key security feature in Azure that allow you to filter inbound and outbound traffic to resources.
  - NSGs can be associated with both subnets and individual network interfaces (NICs).
  - Provide granular control by defining security rules that specify allowed or denied traffic.

- **Application Scenarios**:
  - Restrict internet access to specific VMs.
  - Allow traffic only from specific IP ranges or subnets.
  - Protect sensitive workloads by isolating them within a subnet.

---

### **Configuring Rules**

- **Default Security Rules**:
  - NSGs come with pre-configured default rules:
    - Allow VNet inbound and outbound traffic.
    - Allow Azure Load Balancer health probes.
    - Deny all inbound traffic from the internet (unless explicitly allowed).

- **Custom Security Rules**:
  - Define specific traffic allowances or restrictions.
  - Rules consist of:
    - **Priority**: Lower number means higher priority; default rules have higher priority numbers.
    - **Source/Destination**: Specify IP addresses, subnets, or service tags (e.g., `Internet`, `VirtualNetwork`, `AzureLoadBalancer`).
    - **Protocol**: Select between TCP, UDP, or Any.
    - **Port Range**: Define the port or port range (e.g., 80 for HTTP, 443 for HTTPS).
    - **Action**: Allow or deny traffic.

**Example Azure CLI Command to Create a Custom Rule**:
```bash
az network nsg rule create \
  --resource-group <resource_group_name> \
  --nsg-name <nsg_name> \
  --name <rule_name> \
  --priority 100 \
  --source-address-prefixes <source_ip_or_range> \
  --destination-address-prefixes <destination_ip_or_range> \
  --destination-port-ranges <port_range> \
  --protocol <protocol> \
  --access Allow
```

---

### **Monitoring NSG Flows**

- **Using Azure Network Watcher**:
  - Enable NSG Flow Logs to capture information about ingress and egress IP traffic through NSGs.
  - Useful for auditing, troubleshooting, and optimizing security rules.

**Steps to Enable NSG Flow Logs**:
1. Open Azure Portal and navigate to **Network Watcher**.
2. Select **NSG Flow Logs**.
3. Choose the desired NSG and enable logs.
4. Store logs in a designated Azure Storage Account.

**Example Azure CLI Command to Enable Flow Logs**:
```bash
az network watcher flow-log configure \
  --resource-group <resource_group_name> \
  --nsg <nsg_name> \
  --enabled true \
  --storage-account <storage_account_name> \
  --retention 30
```

- **Analyzing Flow Logs**:
  - Use Azure Log Analytics or third-party tools to visualize and analyze traffic patterns.
  - Identify misconfigurations or potential security risks.

