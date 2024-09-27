# MICROSOFT ENTRA

Microsoft Entra (old Azure AD) is Microsoft cloud-based identity and access management service.

Key Feautres:
- Authentication: enables users to sign in using credentials 
- **Single Sign-On (SSO)**: users can access multiple applications using one set of credentials
- **Multi-Factor Authentication (MFA**): adds extra layer of security by requiring additional verification steps beyond passwords
- **Conditional Access**: controls access to resources based on conditions like user location, device, risk level
- Identity protection: helps detect and prevent identity risks, such as compromised accounts


Microsoft Entra Editions:
- **Free** 
- **Premium P1** (adds Conditional Access, Hybrid Identities)
- **Premium P2** (includes Identity Protection and Privilaged Identity Management [PIM])

Group Types:
- Security groups: assign permissions to a collection of usrs
- Microsoft 365 Groups: enables collaboration with a set of users with access to email, calendars, documents etc.
- Dynamic Groups: groupds that automatically adjust membership based on user attributes (department, role)


Roles:
- Azure AD Roles: used to control management access to Microsoft Entra resources: Global Administrator, User Administrator etc.
- Azure Roles (RBAC): control access to Azure resources like VMs, storage etc..

Identity Management:
- **Self-Service Password Reset (SSPR)**: allows users to reset their passwords without contacting IT support
- **Hybrid Identity**: integrates on-premises Active Directory with Microsoft Entra to enable single identity across both environments using **Azure AD Connect**

---

# ROLE DEFINITIONS

## Control Plane vs. Data Plane:
- Control plane actions (under Actions) are operations on resources themselves (e.g., creating or deleting a VM).
- Data plane actions (under DataActions) are operations on the data within the resource (e.g., reading blob data from a storage account).

## Wildcards
You can use * to allow all actions for a specific resource. For example:
"Microsoft.Storage/*" grants all storage account-related permissions.

## Scope Management
**AssignableScopes** determines where the role can be applied, ensuring that roles are limited to the correct scope.

{
  // Name of the custom role
  "Name": "Custom Role with All Fields",
  
  // Always set to true for custom roles
  "IsCustom": true,
  
  // Description of what the role is intended for
  "Description": "This role has a combination of actions, data actions, and specific scopes.",
  
  // Permissions for control plane actions (resource management actions)
  "Actions": [
    // This allows the role to read virtual machines
    "Microsoft.Compute/virtualMachines/read",
    
    // This allows the role to list storage accounts
    "Microsoft.Storage/storageAccounts/listKeys/action"
  ],
  
  // These are specific actions this role cannot perform (overrides actions listed in 'Actions')
  "NotActions": [
    // This prevents the role from deleting virtual machines
    "Microsoft.Compute/virtualMachines/delete"
  ],
  
  // Permissions for data plane actions (actions on data within a resource, such as reading blob data)
  "DataActions": [
    // Allows read access to blobs within a storage account
    "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read"
  ],
  
  // Actions on data that this role is explicitly denied (overrides 'DataActions')
  "NotDataActions": [
    // Prevents the role from writing blob data, even though they can read it
    "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write"
  ],
  
  // Specifies the scope(s) where this role can be assigned
  // Scopes can be a subscription, resource group, or specific resource
  "AssignableScopes": [
    // Example scope for a subscription
    "/subscriptions/<subscription-id>",
    
    // Example scope for a resource group
    "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>"
  ]
}
