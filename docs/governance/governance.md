# Governance and Compliance in Azure

## Why is Governance Important?
Governance ensures that your Azure environment is managed in a way that aligns with your organization's standards and regulatory requirements. It helps:
- Enforce security and compliance rules.
- Control resource sprawl and costs.
- Manage access and responsibilities effectively.

---

## Core Components of Governance in Azure

### 1. Azure Policy
**What it does**: Ensures resources meet compliance by defining rules (policies) that enforce or audit configurations.

#### Key Features:
- Policies can **audit**, **deny**, or **deploy** specific configurations.
- Example: Ensure all storage accounts have Secure Transfer enabled.

#### How to Use:
1. Create a policy definition (a JSON file that defines the rule).
2. Assign the policy to a scope (management group, subscription, resource group, or resource).

#### Tip:
Use built-in policies to start, such as "Allowed Resource Types" or "Enforce Tag".

#### Quick Demo Example:
Enforce all storage accounts to use **HTTPS only**:
```json
{
  "if": {
    "field": "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
    "equals": "false"
  },
  "then": {
    "effect": "deny"
  }
}
```

---

### 2. Role-Based Access Control (RBAC)
**What it does**: Grants users or groups specific permissions to resources.

#### Key Concepts:
- **Roles**: Predefined sets of permissions (e.g., Reader, Contributor).
- **Scope**: Levels where roles are applied (management group, subscription, resource group, or resource).

#### Best Practices:
- Follow the **principle of least privilege** (only give the access someone needs).
- Use **Azure AD groups** to assign roles instead of assigning them directly to users.

#### Real-World Example:
Assign the **Reader** role to a group at the resource group level so they can view resources without making changes.

---

### 3. Management Groups and Subscriptions
**Management Groups**:
- Organize and group multiple subscriptions.
- Apply policies, RBAC, and budgets at the management group level for centralized control.

**Subscriptions**:
- Logical containers for resources.
- Help separate billing and resource organization.

#### Hierarchy Example:
```
Management Group (ContosoCorp)
  ├── Subscriptions (Prod, Dev, Test)
```

#### Best Practices:
Create a management group hierarchy that mirrors your organization (e.g., split by business units, regions, or environments).

---

### 4. Azure Blueprints
**What it does**: Packages templates, policies, RBAC roles, and resource groups into a single deployment.

#### Use Cases:
- Enforce consistent environments across subscriptions.
- Automatically apply governance at scale.

#### Example Blueprint:
A blueprint for a production environment might include:
- A policy to enforce tags (e.g., “Environment: Production”).
- An RBAC role to allow developers access to specific resources.
- A resource group template for all required resources.

---

### 5. Tags
**What it does**: Attach metadata (key-value pairs) to resources for organization and cost management.

#### Use Cases:
- Add tags like `Owner`, `CostCenter`, or `Environment` to resources.

#### Best Practices:
- Enforce tagging with Azure Policy.
- Standardize tag names and values.
