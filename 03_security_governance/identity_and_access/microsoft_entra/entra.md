# Entra ID (Azure Active Directory) Summary

## Hybrid Identity
Hybrid identity allows organizations to integrate on-premises Active Directory with Entra ID (Azure AD) for seamless authentication and user management.

### **Key Components:**
- **Azure AD Connect**: Syncs on-premises Active Directory users, groups, and credentials with Azure AD.
- **Password Hash Sync (PHS)**: Syncs password hashes from on-prem AD to Azure AD for cloud authentication.
- **Pass-Through Authentication (PTA)**: Authenticates users directly against on-prem AD without storing credentials in Azure AD.

**Use PHS** if you want a simple, secure way to authenticate cloud users.
**Use PTA** if you want authentication requests to be validated against on-prem AD in real time.

---

## Privileged Identity Management (PIM)
Entra ID **Privileged Identity Management (PIM)** provides Just-In-Time (JIT) access control for managing privileged accounts.

### **Key Features:**
- **JIT (Just-In-Time) Access**: Users get temporary admin privileges instead of permanent assignments.
- **Approval Workflows**: Require additional approvals before escalating privileges.
- **Access Reviews**: Enforce periodic reviews of privileged roles.
- **Alerts & Monitoring**: Track privileged role assignments and unusual activity.

**Use PIM** to reduce security risks by minimizing permanent admin access.

---

## Conditional Access
Conditional Access policies enhance security by enforcing access requirements based on risk factors.

### **Key Features:**
- **Multi-Factor Authentication (MFA)**: Requires users to verify identity with additional authentication (e.g., SMS, app, biometric).
- **Block Legacy Authentication**: Prevents outdated protocols (e.g., POP, IMAP) from bypassing security policies.
- **Require Compliant Devices**: Ensures that only devices meeting security policies (e.g., Intune-managed) can access resources.
- **Risk-Based Conditional Access**: Integrates with **Azure AD Identity Protection** to evaluate user risk levels before granting access.

**Use Conditional Access** to enforce secure access policies and mitigate identity-based threats.

---
