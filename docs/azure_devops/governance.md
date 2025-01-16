## Most Important and Useful Information for **Governance and Reporting**

### **11.1 Implementing Policy Management with Azure Policy**

#### **Azure Policy Overview**
- **Azure Policy** helps enforce organizational standards and assess compliance at scale.
- Enables governance by ensuring resources adhere to defined rules and regulations.

#### **Creating and Assigning Policies**
- Use **built-in policy definitions** (e.g., allowed locations, VM size restrictions).
- Create **custom policy definitions** using JSON for specific requirements.
- Assign policies to scopes such as **subscriptions**, **resource groups**, or **individual resources**.

#### **Policy Initiatives**
- Group related policies into **initiatives** for easier management.
- Example: Combine multiple security-related policies into a single security initiative.

#### **Compliance Tracking and Remediation**
- Monitor compliance status in the **Azure Policy dashboard**.
- Use **remediation tasks** to automatically bring non-compliant resources into compliance.
- Set up alerts for non-compliance using **Azure Monitor**.

---

### **11.2 Creating Dashboards and Reports for DevOps KPIs**

#### **Key DevOps KPIs**
- **Deployment Frequency**: Number of deployments in a given period.
- **Change Lead Time**: Time from code commit to production deployment.
- **Mean Time to Recovery (MTTR)**: Time to recover from a failure.
- **Change Failure Rate**: Percentage of deployments causing failures.

#### **Creating Dashboards**
- Use **Azure Dashboards** to visualize DevOps KPIs:
  - Integrate data from **Azure DevOps**, **Application Insights**, and **Log Analytics**.
  - Customize widgets to display build statuses, deployment durations, and issue tracking.
- Use **Power BI** for advanced reporting and visualization:
  - Connect Power BI to **Azure DevOps Analytics** for detailed insights.
  - Schedule data refreshes and share reports with stakeholders.

#### **Automated Reporting**
- Set up **Azure Pipelines** to generate automated reports after deployments.
- Use tools like **Excel**, **Grafana**, or **Kibana** for additional report customization.

---

### **11.3 Managing Work-in-Progress (WIP) Limits and Cycle Time Metrics**

#### **Work-in-Progress (WIP) Limits**
- WIP limits help teams focus on completing tasks before starting new ones.
- Benefits:
  - Reduces task switching and bottlenecks.
  - Improves flow and delivery speed.
- Implement WIP limits in **Azure Boards Kanban** settings:
  - Set limits for specific columns (e.g., In Progress, Review).

#### **Cycle Time Metrics**
- **Cycle Time** measures the time taken from task start to completion.
- Helps identify process inefficiencies and areas for improvement.
- Use Azure Boards to track cycle time:
  - Configure queries to calculate cycle time for work items.
  - Visualize trends using built-in or custom dashboards.

#### **Continuous Improvement**
- Regularly review WIP limits and cycle time metrics during retrospectives.
- Adjust limits and workflows based on team capacity and feedback.
- Use insights to streamline processes and improve delivery timelines.

