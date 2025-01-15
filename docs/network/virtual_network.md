## **Configure Azure Virtual Networks (VNets), Subnets, and IP Addressing**

### **Understanding VNets**

- **Purpose of VNets**:
  - Azure Virtual Networks (VNets) allow you to isolate and secure Azure resources by defining private network boundaries.
  - Enable secure communication between Azure services, on-premises environments, and the internet.
  - VNets support advanced features like virtual appliances, service endpoints, and peering.

- **VNet Peering vs. VPN Gateway**:
  - **VNet Peering**:
    - Connects VNets within the same or different regions via Azure backbone network.
    - Low latency and high bandwidth.
    - No public internet required for traffic.
  - **VPN Gateway**:
    - Securely connects on-premises networks to Azure VNets over IPsec/IKE.
    - Enables cross-region VNet connectivity via encrypted tunnels.
    - Suitable for hybrid cloud scenarios.

---

### **Subnets**

- **Dividing VNets into Smaller Segments**:
  - VNets are segmented into subnets to organize resources and control traffic flow.
  - Subnets allow allocation of specific IP address ranges within a VNet.
  - Enables separation of resources based on workload or environment (e.g., web, application, database).

- **Assigning Subnet-Specific Network Security Groups (NSGs) and Route Tables**:
  - **NSGs**:
    - Control inbound and outbound traffic at the subnet level.
    - Configure rules based on source, destination, port, and protocol.
    - Default rules allow VNet traffic and block inbound internet by default.
  - **Route Tables**:
    - Define custom routes to control traffic flow within and outside the VNet.
    - Use User-Defined Routes (UDRs) for specific traffic paths (e.g., routing to a virtual appliance).

---

### **IP Addressing**

- **Static vs. Dynamic IP Allocation**:
  - **Static IP**:
    - Manually assigned and does not change.
    - Suitable for resources requiring consistent IP addresses, like DNS servers or critical applications.
  - **Dynamic IP**:
    - Automatically assigned from a defined pool.
    - Default option for most Azure resources, suitable for general workloads.

- **Private vs. Public IP Addresses**:
  - **Private IP**:
    - Used for communication within the VNet.
    - Not accessible from the internet.
    - Assigned to resources like VMs, databases, and application servers.
  - **Public IP**:
    - Enables internet connectivity for resources.
    - Used for web applications, VPN gateways, or load balancers.

- **Configuring Service Endpoints for Secure Access to Azure Services**:
  - Extend VNet identity to Azure services like Storage, SQL, and Cosmos DB.
  - Traffic remains on the Azure backbone network, improving security and performance.
  - **Enabling a Service Endpoint**:
    ```bash
    az network vnet subnet update \
      --name <subnet_name> \
      --vnet-name <vnet_name> \
      --resource-group <resource_group_name> \
      --service-endpoints <service_type>
    ```

