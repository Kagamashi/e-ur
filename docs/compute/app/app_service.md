### **Azure App Services**

#### 1. **Manage App Hosting Environments**

##### **Types of App Services**
- **Web Apps**: Host web applications using various frameworks (ASP.NET, Java, Python, etc.).
- **API Apps**: Deploy RESTful APIs with built-in security and scalability.
- **Mobile Apps**: Back-end services for mobile applications with features like push notifications and offline sync.
- **Function Apps**: Serverless computing to run event-driven code.

##### **Deployment Options**
- **Azure Portal**: Directly deploy and manage App Services through the graphical interface.
- **CLI**: Use commands like `az webapp up` to deploy applications from the command line.
- **GitHub Actions**: Automate deployments using CI/CD workflows integrated with GitHub.
- **DevOps Pipelines**: Set up CI/CD pipelines in Azure DevOps for automated builds and deployments.

##### **Scaling App Services**
- **Manual Scaling**: Manually increase or decrease the number of instances or resources.
- **Autoscaling**: Automatically adjust resources based on predefined rules and metrics like CPU or memory usage.
    - **Horizontal Scaling**: Add more instances to handle increased load.
    - **Vertical Scaling**: Increase the resources (CPU, RAM) of existing instances.

##### **Configuring Custom Domains and SSL/TLS Certificates**
- **Custom Domains**: Map your app service to a custom domain using DNS settings.
- **SSL/TLS Certificates**: Secure your custom domain by:
    - Using a free Azure App Service Managed Certificate.
    - Uploading your own certificates.
    - Enabling HTTPS-only traffic to enhance security.
