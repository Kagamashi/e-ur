## Assign Roles and Configure Role-Based Access Control (RBAC)

### Understanding Built-in and Custom Roles
- **Built-in Roles**: Predefined roles provided by Azure, such as Owner, Contributor, and Reader.
- **Custom Roles**: User-defined roles with specific permissions tailored to business needs.

### Assigning Roles to Users, Groups, and Managed Identities
- Roles can be assigned to:
  - **Users**: Individuals with Azure accounts.
  - **Groups**: Collection of users for bulk role assignments.
  - **Managed Identities**: Identities tied to resources like VMs for automated access control.

### Managing Role Assignments
- **Azure Portal**: Assign roles through the IAM (Identity and Access Management) blade.
- **Azure CLI**:
  ```bash
  az role assignment create --assignee <user_or_group_id> --role <role_name> --scope <scope>
  ```
- **PowerShell**:
  ```powershell
  New-AzRoleAssignment -ObjectId <user_or_group_id> -RoleDefinitionName <role_name> -Scope <scope>
  ```

