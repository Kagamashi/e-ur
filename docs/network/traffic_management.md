## **Network Traffic Management**

### **Configure Load Balancers, Traffic Managers, and Application Gateways**

#### **Load Balancers**

- **Types**:
  - **Basic**:
    - Free tier with limited features.
    - No support for availability zones.
    - Suitable for non-critical workloads.
  - **Standard**:
    - Advanced features such as secure by default, zone-redundancy, and diagnostics.
    - Supports both regional and global scenarios.
    - Recommended for production workloads.

- **Configuring Backend Pools, Health Probes, and Load-Balancing Rules**:
  - **Backend Pools**:
    - Define the set of virtual machines or virtual machine scale sets that will receive traffic.
  - **Health Probes**:
    - Ensure only healthy instances in the backend pool receive traffic.
    - Configure custom probes for HTTP, HTTPS, or TCP.
  - **Load-Balancing Rules**:
    - Distribute incoming traffic based on specific ports.
    - Define frontend IP configurations, backend pools, and probe associations.

- **Differences Between Public and Internal Load Balancers**:
  - **Public Load Balancer**:
    - Distributes traffic from the internet to VMs in the backend pool.
  - **Internal Load Balancer**:
    - Distributes traffic within a virtual network (VNet).
    - Used for backend services like databases or internal APIs.

---

#### **Traffic Manager**

- **DNS-Based Traffic Routing for High Availability**:
  - Routes incoming traffic based on DNS queries.
  - Ensures high availability by distributing traffic across multiple regions or endpoints.

- **Routing Methods**:
  - **Priority**:
    - Direct traffic to a primary endpoint, with failover to secondary endpoints.
  - **Weighted**:
    - Distribute traffic proportionally across endpoints based on assigned weights.
  - **Performance**:
    - Route traffic to the endpoint with the lowest latency.
  - **Geographic**:
    - Direct users to endpoints based on their geographic location.

---

#### **Application Gateways**

- **Layer 7 (HTTP/HTTPS) Load Balancing**:
  - Provides intelligent routing based on URL paths and host headers.
  - Supports SSL termination, which offloads decryption to the gateway.

- **Configuring Web Application Firewall (WAF)**:
  - Protects against common web vulnerabilities like SQL injection, cross-site scripting (XSS), and others.
  - Predefined and custom rules can be applied to inspect traffic.

- **Setting Up Backend Pools, HTTP Settings, and URL-Based Routing**:
  - **Backend Pools**:
    - Define target endpoints for traffic (VMs, App Services, etc.).
  - **HTTP Settings**:
    - Configure timeout, backend port, and protocol (HTTP/HTTPS).
    - Enable session affinity and connection draining.
  - **URL-Based Routing**:
    - Route traffic based on URL paths (e.g., `/images` or `/videos`).
    - Useful for deploying microservices or separating static and dynamic content.

