## **Implement Network Routing and DNS**

### **Routing**

- **System Routes vs. Custom Routes**:
  - **System Routes**:
    - Automatically created by Azure for default traffic flow.
    - Handles traffic between VNets, on-premises networks, and the internet.
    - Includes routes for **VNet-to-VNet**, **VNet-to-Internet**, and **VNet-to-On-Premises** traffic.
  
  - **Custom Routes**:
    - User-defined to override or supplement system routes.
    - Useful for directing traffic to network virtual appliances (e.g., firewalls).
    - Allows control over traffic flow for specific scenarios.

- **Configuring User-Defined Routes (UDRs)**:
  - Define custom routes to direct traffic to a specific next hop (e.g., virtual appliance, VPN gateway).
  - **Steps to Configure UDRs**:
    1. Create a route table.
    2. Add a route to the table with the desired destination and next hop.
    3. Associate the route table with a subnet.

  - **CLI Example**:
    ```bash
    az network route-table create \
      --resource-group <resource_group_name> \
      --name <route_table_name>

    az network route-table route create \
      --resource-group <resource_group_name> \
      --route-table-name <route_table_name> \
      --name <route_name> \
      --address-prefix <destination_address_prefix> \
      --next-hop-type <next_hop_type> \
      --next-hop-ip-address <next_hop_ip>

    az network vnet subnet update \
      --resource-group <resource_group_name> \
      --vnet-name <vnet_name> \
      --name <subnet_name> \
      --route-table <route_table_name>
    ```

---

### **DNS**

- **Azure DNS for Custom Domain Management**:
  - Host your domain names in Azure for global reach and high availability.
  - Supports all common DNS record types (A, AAAA, CNAME, MX, etc.).
  - Enables seamless integration with Azure services.
  
  - **CLI Example to Create a DNS Zone**:
    ```bash
    az network dns zone create \
      --resource-group <resource_group_name> \
      --name <domain_name>
    ```

- **Private DNS Zones for Name Resolution within VNets**:
  - Facilitates internal name resolution without exposing records to the internet.
  - Useful for scenarios involving hybrid or multi-VNet deployments.
  - Supports automatic registration of VM hostnames within a VNet.

  - **CLI Example to Create a Private DNS Zone**:
    ```bash
    az network private-dns zone create \
      --resource-group <resource_group_name> \
      --name <private_domain_name>
    ```

  - **Linking a Private DNS Zone to a VNet**:
    ```bash
    az network private-dns link vnet create \
      --resource-group <resource_group_name> \
      --zone-name <private_domain_name> \
      --name <link_name> \
      --virtual-network <vnet_id> \
      --registration-enabled true
    ```

- **Integrating Azure DNS with On-Premises DNS via Conditional Forwarding**:
  - Enables seamless name resolution across hybrid environments.
  - On-premises DNS forwards queries for specific domains to Azure DNS.
  - Use Azure DNS Private Resolver for efficient forwarding and resolution.

  - **Setting Up Conditional Forwarding**:
    1. Configure Azure DNS Private Resolver.
    2. Define forwarding rules for specific domains.
    3. Ensure proper connectivity between on-premises and Azure VNets (via VPN or ExpressRoute).

