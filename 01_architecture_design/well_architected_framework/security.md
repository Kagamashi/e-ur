# Security in Cloud Architecture

## Overview
Security is about **protecting data, applications, infrastructure, and identities** from unauthorized access and attacks. Organizations must implement **defense in depth** strategies to mitigate risks and ensure compliance with regulatory requirements.

---

## Key Security Principles

### **1. Defense in Depth Approach**
Security is applied in multiple layers to minimize risk:
- **Data Security** – Protect sensitive information with encryption and access controls.
- **Application Security** – Prevent malicious attacks like **SQL injection** and **cross-site scripting (XSS)**.
- **Compute Security** – Safeguard VMs and workloads from malware and unauthorized access.
- **Network Security** – Restrict unnecessary open ports and use firewalls to prevent unauthorized access.
- **Perimeter Security** – Protect against denial-of-service (DoS) attacks.
- **Policies & Access Controls** – Implement strong authentication and identity management practices.
- **Physical Security** – Secure datacenter access to prevent unauthorized entry.

### **2. Protect Against Common Threats**
- **Data Layer** – Use strong encryption and secure key management.
- **Application Layer** – Implement secure coding practices to prevent vulnerabilities.
- **VM/Compute Layer** – Utilize endpoint protection and restrict administrative access.
- **Network Layer** – Secure remote access with VPNs and limit internet-exposed ports.
- **Perimeter Layer** – Deploy DDoS protection to prevent service disruptions.
- **Policies & Access** – Enforce least privilege access and multi-factor authentication (MFA).
- **Physical Layer** – Restrict access to datacenters and monitor security logs.

### **3. Shared Security Responsibility Model**
- **Cloud Provider Responsibilities** – Infrastructure security, network protection, and physical security.
- **Customer Responsibilities** – Data security, identity management, and workload protection.
- **Evaluating Cloud Services** – Choose the right security controls based on your cloud model (IaaS, PaaS, SaaS).

---

## Summary
Security in the cloud requires a **multi-layered defense strategy**, addressing **data protection, application security, network defense, and identity management**. Organizations must adopt **shared security responsibility models** to ensure **compliance, trust, and resilience** against cyber threats.

