### Configure Backup, Monitoring, and Updates for Azure Virtual Machines

#### **Backup**
- **Configuring VM Backup Policies**:
  - Use **Azure Recovery Services Vault** to back up VMs.
  - Steps to configure:
    1. Create a Recovery Services Vault.
    2. Define a backup policy (daily, weekly, monthly).
    3. Associate the policy with the VM.
  - Enable **application-consistent backups** for data integrity.

- **Retention and Recovery Options**:
  - Short-term retention: Keep daily backups for up to 30 days.
  - Long-term retention: Store backups for months or years.
  - Recovery options:
    - Restore entire VM.
    - Restore disks and attach to an existing VM.
    - File-level recovery.

#### **Monitoring**
- **Azure Monitor for VMs**:
  - Collects performance metrics (CPU, memory, disk I/O).
  - Monitors guest OS logs.

- **Analyzing Metrics and Logs**:
  - Use **Log Analytics** for deep insights.
  - Common queries:
    - Identify high CPU usage: `Perf | where CounterName == "% Processor Time"`
    - Check disk space: `Perf | where CounterName == "Free Megabytes"`

- **Configuring Alerts**:
  - Set up alerts for specific conditions, e.g., CPU > 80%.
  - Use **Action Groups** to notify stakeholders via email, SMS, or webhook.

#### **Updates**
- **Azure Update Management**:
  - Automates patching for Windows and Linux VMs.
  - Integration with Azure Automation.

- **Scheduling and Reviewing Update Deployments**:
  - Define maintenance windows to apply updates.
  - Review update compliance through **Update Insights**.
  - Deploy critical and security updates immediately when necessary.

