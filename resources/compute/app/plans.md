## **Configure App Service Plans**

### **App Service Plan Pricing Tiers**
Azure App Service Plans determine the resources and capabilities available for your applications. Pricing tiers include:

1. **Free and Shared (Dev/Test)**:
   - Basic hosting for small, low-traffic apps.
   - No custom domain support.
   - Limited to shared infrastructure.

2. **Basic**:
   - Suitable for production workloads with low traffic.
   - Supports custom domains.

3. **Standard**:
   - Includes autoscaling and load balancing.
   - Custom domains and SSL/TLS support.

4. **Premium**:
   - Designed for high-traffic production apps.
   - Enhanced performance and scaling capabilities.
   - Supports isolated environments with VNet integration.

5. **Isolated**:
   - High-security, dedicated environments.
   - Provides maximum scalability and performance.

### **Scaling Service Plans**

1. **Manual Scaling**:
   - Manually increase or decrease the number of instances to handle load.
   - Change the pricing tier for increased performance or features.

2. **Automatic Scaling**:
   - Configure autoscale rules based on metrics (e.g., CPU usage, memory usage).
   - Scale out (add instances) or scale in (remove instances) automatically.

**Example Azure CLI Command:**
```bash
az monitor autoscale create \
  --resource-group <resource_group> \
  --resource <app_service_plan> \
  --min-count 1 \
  --max-count 5 \
  --count 2
```

### **Configuring Deployment Slots**

1. **Purpose**:
   - Deployment slots allow you to deploy and test updates in a staging environment before swapping to production.

2. **Key Features**:
   - Zero-downtime deployments.
   - Easy rollback by swapping slots.

3. **Common Slots**:
   - Production
   - Staging
   - Testing

**Example Azure CLI Command:**
```bash
az webapp deployment slot create \
  --name <webapp_name> \
  --resource-group <resource_group> \
  --slot staging
```

### **Monitoring and Diagnostics for App Services**

1. **Monitoring Metrics**:
   - Track performance metrics such as CPU usage, memory, and response times.
   - Use Azure Monitor and Application Insights for detailed telemetry.

2. **Diagnostics**:
   - Enable diagnostic logs (e.g., HTTP logs, application logs).
   - Configure log streaming and download logs for troubleshooting.

**Example Azure CLI Command:**
```bash
az webapp log config \
  --name <webapp_name> \
  --resource-group <resource_group> \
  --application-logging true \
  --web-server-logging filesystem
```

3. **Alerts**:
   - Set up alerts for critical conditions such as high CPU usage or service unavailability.
   - Integrate with email or SMS for immediate notifications.

**Example Azure CLI Command to Create Alert:**
```bash
az monitor metrics alert create \
  --name HighCPUAlert \
  --resource-group <resource_group> \
  --scopes <app_service_resource_id> \
  --condition "avg Percentage CPU > 80" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --action-group <action_group_id>
```

