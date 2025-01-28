## **Monitor and Troubleshoot Virtual Network Connectivity**

### **Azure Network Watcher**

- **Connection Troubleshoot and Next-Hop Analysis**:
  - Use **Connection Troubleshoot** to test the connectivity between a source and destination.
  - **Next-Hop Analysis** identifies the next hop for packets from a virtual machine, helping diagnose routing issues.

  - **CLI Examples**:
    ```bash
    az network watcher show-next-hop \
      --resource-group <resource_group_name> \
      --vm-name <vm_name> \
      --source-ip <source_ip> \
      --dest-ip <destination_ip>

    az network watcher connection-monitor create \
      --name <monitor_name> \
      --resource-group <resource_group_name> \
      --source-resource <source_vm_id> \
      --dest-resource <destination_vm_id>
    ```

- **Packet Capture for Analyzing Network Traffic**:
  - Enables capturing and analyzing packets to troubleshoot latency or connectivity issues.
  - Capture data can be stored in Azure Storage for detailed examination.

  - **CLI Example to Start a Packet Capture**:
    ```bash
    az network watcher packet-capture create \
      --resource-group <resource_group_name> \
      --vm <vm_name> \
      --storage-account <storage_account_name> \
      --name <capture_name>
    ```

---

### **Diagnosing Connectivity Issues**

- **Verifying Effective NSG Rules and Route Configurations**:
  - **Effective NSG Rules**:
    - Use **Effective Security Rules** to view active NSG rules applied to a VM or subnet.
    - Helps identify whether traffic is being allowed or blocked.

    - **CLI Example**:
      ```bash
      az network nic show-effective-nsg \
        --resource-group <resource_group_name> \
        --name <nic_name>
      ```

  - **Effective Routes**:
    - Check the routing table for a VM to confirm traffic flow.

    - **CLI Example**:
      ```bash
      az network nic show-effective-route-table \
        --resource-group <resource_group_name> \
        --name <nic_name>
      ```

- **Troubleshooting VNet Peering and VPN Connectivity**:
  - Verify that VNet peering is configured correctly (e.g., no overlapping address spaces, proper DNS settings).
  - Ensure VPN Gateway connections are active and correctly configured.
  - Use **Azure Network Watcher VPN Troubleshoot** to diagnose common VPN issues.

  - **CLI Example for VPN Troubleshoot**:
    ```bash
    az network vpn-connection show \
      --resource-group <resource_group_name> \
      --name <vpn_connection_name>
    ```

---

### **Monitoring with Azure Monitor**

- **Setting Up Alerts for Network Metrics**:
  - Configure alerts for critical metrics like latency, throughput, and dropped packets.
  - Use pre-defined metrics or custom log queries to monitor specific events.

  - **CLI Example to Create an Alert**:
    ```bash
    az monitor metrics alert create \
      --name <alert_name> \
      --resource-group <resource_group_name> \
      --scopes <resource_id> \
      --condition "avg Percentage CPU > 80" \
      --description "High CPU Alert"
    ```

- **Analyzing Traffic Patterns Using Traffic Analytics**:
  - Use Traffic Analytics with **Network Watcher** to visualize and analyze traffic patterns.
  - Provides insights into traffic flow, network bottlenecks, and potential security risks.

  - **Steps to Enable Traffic Analytics**:
    1. Configure **NSG Flow Logs**.
    2. Link flow logs to a Log Analytics workspace.
    3. Enable **Traffic Analytics** in the workspace.

  - **CLI Example to Enable Flow Logs**:
    ```bash
    az network watcher flow-log configure \
      --resource-group <resource_group_name> \
      --nsg-name <nsg_name> \
      --enabled true \
      --workspace <log_analytics_workspace_id>
    ```

