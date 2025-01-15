## **Secure and Optimize Networks**

### **Configure Azure Firewall, VPN Gateway, and ExpressRoute**

---

### **Azure Firewall**

- **Overview**:
  - Azure Firewall is a **stateful network security service** that provides granular control over network traffic.
  - Protects Azure Virtual Networks by filtering traffic using both **application** and **network rules**.

- **Features**:
  - Centralized policy management for traffic across multiple VNets.
  - Fully integrated with Azure Monitor for logging and analytics.
  - Supports **TLS inspection** and **threat intelligence-based filtering**.

- **Configuring Azure Firewall**:
  - **Application Rules**:
    - Allow or deny traffic based on **FQDNs** (e.g., `*.microsoft.com`).
    - Useful for controlling internet access to specific applications.
  
  - **Network Rules**:
    - Control traffic using **source IP**, **destination IP**, **ports**, and **protocols**.
    - Suitable for internal or hybrid network traffic filtering.

  - **Example: Create a Network Rule**:
    ```bash
    az network firewall policy rule-collection-group collection-rule add \
      --firewall-policy-name <firewall_policy_name> \
      --resource-group <resource_group_name> \
      --rule-collection-group-name <group_name> \
      --name <rule_name> \
      --priority 100 \
      --rule-type NetworkRule \
      --action Allow \
      --rule-name <rule_name> \
      --ip-protocols TCP \
      --source-addresses <source_ip> \
      --destination-addresses <destination_ip> \
      --destination-ports <ports>
    ```

---

### **VPN Gateway**

- **Overview**:
  - Securely connects **on-premises networks** to Azure VNets using encrypted tunnels.
  - Supports both **Site-to-Site (S2S)** and **Point-to-Site (P2S)** VPN configurations.

- **Types of VPN Gateway**:
  - **Site-to-Site (S2S)**:
    - Connects entire on-premises networks to Azure VNets.
    - Uses IPsec/IKE protocol for encryption.
  
  - **Point-to-Site (P2S)**:
    - Enables remote users to securely connect to Azure resources.
    - Supports RADIUS and Azure Active Directory for authentication.

- **Configuring a VPN Gateway**:
  - **Create a VPN Gateway**:
    ```bash
    az network vnet-gateway create \
      --name <gateway_name> \
      --public-ip-address <public_ip_name> \
      --resource-group <resource_group_name> \
      --vnet <vnet_name> \
      --gateway-type Vpn \
      --vpn-type RouteBased
    ```

  - **Add Local Network Gateway (for S2S)**:
    ```bash
    az network local-gateway create \
      --resource-group <resource_group_name> \
      --name <local_gateway_name> \
      --gateway-ip-address <on_premises_ip> \
      --address-prefixes <on_premises_subnet>
    ```

  - **Create a Connection**:
    ```bash
    az network vpn-connection create \
      --resource-group <resource_group_name> \
      --name <connection_name> \
      --vnet-gateway1 <gateway_name> \
      --local-gateway2 <local_gateway_name> \
      --shared-key <shared_key>
    ```

---

### **ExpressRoute**

- **Overview**:
  - Provides a **private, dedicated connection** between on-premises networks and Azure.
  - Bypasses the public internet, offering **higher reliability, lower latency, and enhanced security**.

- **Key Components**:
  - **ExpressRoute Circuit**:
    - The logical connection between on-premises and Azure.
    - Bandwidth options range from 50 Mbps to 10 Gbps.
  
  - **Routing Domains**:
    - **Azure Private Peering**: For VNet-to-on-premises connectivity.
    - **Microsoft Peering**: For accessing Microsoft SaaS services like Office 365.
    - **Public Peering** (deprecated): For accessing Azure public services like Storage.

- **Setting Up ExpressRoute**:
  - **Create an ExpressRoute Circuit**:
    ```bash
    az network express-route create \
      --name <circuit_name> \
      --resource-group <resource_group_name> \
      --bandwidth <bandwidth_in_mbps> \
      --peering-location <peering_location> \
      --provider <provider_name>
    ```

  - **Create a VNet Gateway for ExpressRoute**:
    ```bash
    az network vnet-gateway create \
      --resource-group <resource_group_name> \
      --name <gateway_name> \
      --vnet <vnet_name> \
      --gateway-type ExpressRoute
    ```

  - **Link VNet to ExpressRoute Circuit**:
    ```bash
    az network vnet-gateway connection create \
      --resource-group <resource_group_name> \
      --name <connection_name> \
      --vnet-gateway1 <gateway_name> \
      --express-route-circuit2 <circuit_name>
    ```

