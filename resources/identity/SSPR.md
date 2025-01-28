# Configure Azure AD Join, Self-Service Password Reset (SSPR), and Conditional Access

## Configuring Azure AD Join for Devices
- **Azure AD Join** enables corporate-owned devices to be fully managed by Azure AD.
- **Prerequisites**:
  - Ensure devices run Windows 10 or 11.
  - Devices must have internet access and be within the corporate network.
  - Users require proper permissions to join devices.
- **Steps to Configure**:
  1. Go to **Azure Active Directory** in the Azure portal.
  2. Navigate to **Devices > Device settings**.
  3. Enable **Users may join devices to Azure AD**.
  4. Configure **Maximum number of devices per user**.

## Enabling and Configuring SSPR
- **SSPR (Self-Service Password Reset)** allows users to reset their passwords without IT intervention.
- **Prerequisites**:
  - Azure AD Premium P1 or P2 license.
  - Users must be registered for SSPR.
- **Steps to Configure**:
  1. In the Azure portal, go to **Azure Active Directory > Password reset**.
  2. Enable **Self-service password reset**.
  3. Configure authentication methods (e.g., email, mobile phone, security questions).
  4. Set the **number of methods required for reset**.
  5. Test the SSPR process.

## Creating and Managing Conditional Access Policies
- **Conditional Access** provides security by enforcing access controls based on conditions.

### Common Scenarios
- Require Multi-Factor Authentication (MFA) for sensitive resources.
- Block legacy authentication.
- Restrict access based on location or device state.

### Steps to Create a Conditional Access Policy
1. In the Azure portal, go to **Azure Active Directory > Security > Conditional Access**.
2. Click **New policy** and provide a name.
3. Configure **Assignments**:
   - **Users or workload identities**: Select specific users or groups.
   - **Cloud apps or actions**: Specify apps to apply the policy to.
   - **Conditions**: Set conditions like location, device state, or risk level.
4. Configure **Access controls**:
   - Grant or block access.
   - Require MFA, compliant devices, or approved client apps.
5. Enable the policy and click **Create**.

**Best Practices**:
- Use the **What If** tool to simulate policy effects.
- Start with a **report-only** mode to monitor policy impact before enforcement.

