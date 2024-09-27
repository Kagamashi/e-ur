
# Tenant
- Dedicated instance of Microsoft entra
- Subscriptions are linked to Tenant


# Subscription
- Logical container that provides access to Azur services and resources
- **Azure Cost Management** can be used to monitor and control spendings at sub level
- **Subscription Policies** help control what types of resources can be deployed within a subscription, for example certain VM sizes or regions can be disallowed
- Defines how resources are grouped and billed
- Each subscription has limits, such as the number of VMs or SA that can be created


# Resource Group
- Resources are organized into RGs
- Permissions and policies can be applied at RG level


**Hierarchy:**
Management Group (root) >
  Management Group (Dept A) >
    Subscription A1 >
      Resource Group X

