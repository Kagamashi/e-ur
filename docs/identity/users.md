# Azure Active Directory: Users, Groups, and Devices

## User Types
- **Member**: Default type for internal organization users.
- **Guest**: External users, such as partners or vendors, typically for B2B collaboration.

**Command:**
```bash
az ad user
```

## Group Types
- **Security Groups**: Used for managing access to Azure resources.
- **Microsoft 365 Groups**: Include collaboration tools like email and Teams.

**Command:**
```bash
az ad group
```

## Membership
- **Manual**
- **Dynamic**: Membership is automatically assigned based on rules.

## Device States
- **Azure AD Registered**: For personal devices (BYOD) accessing Azure resources.
- **Azure AD Joined**: Corporate-owned devices managed by Azure AD.
- **Hybrid Azure AD Joined**: Devices joined to on-premises AD and registered with Azure AD for hybrid environments.

**Command:**
```bash
az ad device
```

