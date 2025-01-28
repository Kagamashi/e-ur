
## Manage Access to Azure Resources

### Assigning Permissions at Different Scopes
- Permissions can be assigned at various scopes:
  - **Subscription**: Access to all resources within the subscription.
  - **Resource Group**: Access to all resources within a specific resource group.
  - **Resource**: Access to a specific resource only.
- Use Role-Based Access Control (RBAC) to assign roles such as Owner, Contributor, or Reader.

**Example Azure CLI Command:**
```bash
az role assignment create --assignee <user_or_group_id> --role <role_name> --scope <scope>
```

### Using Azure AD Privileged Identity Management (PIM) for Just-in-Time Access
- PIM allows time-limited, role-based access to resources to reduce security risks.
- Configure PIM to require approval for activating roles.
- Use PIM to activate roles on demand with an expiration time.

### Monitoring Access through Activity Logs and Alerts
- Use Azure Monitor and Activity Logs to track access and changes to resources.
- Set up alerts to notify administrators of unauthorized or critical access events.

**Example Azure CLI Command to View Activity Logs:**
```bash
az monitor activity-log list --resource-group <resource_group_name>
```

