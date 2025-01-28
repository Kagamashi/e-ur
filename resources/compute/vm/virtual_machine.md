### **Azure Virtual Machines (VMs)**

#### **1. Create and Configure VMs**

##### **VM Types**
- **General-purpose**: Balanced CPU-to-memory ratio; suitable for testing, development, and small-to-medium databases.
  - Examples: B-series, D-series.
- **Compute-optimized**: High CPU-to-memory ratio; ideal for web servers, batch processing.
  - Examples: F-series.
- **Memory-optimized**: High memory-to-CPU ratio; used for large databases, in-memory caching.
  - Examples: E-series, M-series.
- **GPU**: Specialized VMs for graphics-intensive workloads, AI, and machine learning.
  - Examples: NV-series, NC-series.
- **Storage-optimized**: High disk throughput and IOPS; suitable for Big Data, SQL, and NoSQL databases.
  - Examples: L-series.

##### **VM Sizes and Selecting the Right Size**
- Consider CPU, memory, disk, and network performance requirements.
- Use the **Azure Pricing Calculator** to estimate costs for different sizes.
- Resize VMs based on performance metrics using **Azure Monitor**.

##### **OS Options**
- **Windows**: Supports a variety of Windows Server versions.
- **Linux**: Popular distributions include Ubuntu, CentOS, Red Hat, SUSE.
- Consider licensing and support requirements when selecting OS.

##### **Configuring VM Settings**

**1. OS and Data Disks**:
- **OS Disk**: Contains the OS; created by default during VM creation.
- **Data Disks**: Additional storage for applications or data; can be Standard HDD, Standard SSD, or Premium SSD.

**2. Networking**:
- **NICs (Network Interface Cards)**: Attach NICs to define network settings.
- **Public IPs**: Assign for external access to the VM.
- **NSGs (Network Security Groups)**: Configure inbound and outbound traffic rules for network security.

**3. Extensions**:
- **Custom Script Extension**: Run scripts to configure VMs post-deployment.
- **VM Agent**: Enables features like Run Command, VM extensions, and diagnostics.

##### **Automating VM Deployments**

**1. ARM Templates**:
- Define infrastructure as code.
- Create reusable templates for consistent deployments.
- Example:
  ```json
  {
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "resources": [
      {
        "type": "Microsoft.Compute/virtualMachines",
        "apiVersion": "2021-07-01",
        "name": "myVM",
        "location": "westeurope",
        "properties": {
          "hardwareProfile": {
            "vmSize": "Standard_D2s_v3"
          }
        }
      }
    ]
  }
  ```

**2. Bicep**:
- Simplified syntax for ARM template authoring.
- Example:
  ```bicep
  resource vm 'Microsoft.Compute/virtualMachines@2021-07-01' = {
    name: 'myVM'
    location: 'westeurope'
    properties: {
      hardwareProfile: {
        vmSize: 'Standard_D2s_v3'
      }
    }
  }
  ```

**3. Terraform**:
- Multi-cloud support with declarative syntax.
- Example:
  ```hcl
  resource "azurerm_virtual_machine" "example" {
    name                  = "myVM"
    location              = "West Europe"
    resource_group_name   = azurerm_resource_group.example.name
    vm_size               = "Standard_D2s_v3"
    network_interface_ids = [azurerm_network_interface.example.id]
  }
  ```

