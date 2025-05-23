# Production Grade Azure Kubernetes Service (AKS) Cluster

## Minimum Conditions a Production AKS Cluster Should Satisfy

### 1. Cluster Configuration

- Private Cluster Endpoint: Disables public API access; only accessible via VNet
- Network Plugin: Use Azure CNI (Overlay or V2) for better performance and VNet IP integration
- Availability Zones: Deploy across at least 2-3 zones for high availability
- Node Pools:
    - Separate system and user node pools
    - Use taints/tolerations to isolate workloads
    - Enable auto-scaling on user node pools
- Kubernetes Version: Keep updated within the supported window (prefer N-1 version)

---

### 2. Identity and Access Management

- Azure AD Integration: Enable Azure AD-based authentication for kubectl and API access
- RBAC (Role-Based Access Control): Use Kubernetes RBAC to limit permissions by namespace or role
- Managed Identity:
    - System-assigned or user-assigned for cluster components
    - Use Workload Identity (preferred over pod-managed identity) to grant AKS workloads access to Azure resources
      securely

---

### 3. Network Security

- Network Policies: Implement policies (via Calico or Azure-native) to control pod-to-pod communication
- Ingress Controller: Use Azure Application Gateway Ingress Controller (AGIC) or NGINX with WAF integration
- Outbound Traffic Control:
    - Use Azure Firewall or Network Virtual Appliance (NVA) for egress control
    - Implement user-defined routes (UDRs) to force traffic through firewall
- Private Link for Services: Use Private Endpoints for PaaS services like Key Vault, Storage, etc.

---

### 4. Data Security

- Encryption at Rest: Enable CMK (Customer Managed Keys) for more control over encryption
- Encryption in Transit: Use HTTPS everywhere. Enforce TLS 1.2+
- Secret Management: Integrate Azure Key Vault with AKS via CSI driver to mount secrets as files or env vars

---

### 5. Application and Container Security

- Container Image Scanning:
    - Use Microsoft Defender for Containers
    - Enforce scanning via Azure Policy
- Pod Security:
    - Use PodSecurityAdmission (Baseline, Restricted)
    - Disallow privileged containers and hostPath volumes
- Admission Controllers:
    - Integrate OPA Gatekeeper or Kyverno to enforce policies (e.g., deny images from untrusted registries)

---

### 6. Observability

- Logging:
    - Enable container and node logs to Log Analytics Workspace
    - Aggregate logs via Fluent Bit or Azure Monitor Agent
- Metrics:
    - Collect Prometheus metrics via managed Prometheus
    - Visualize via Grafana or Azure Dashboard
- Tracing:
    - Integrate OpenTelemetry or Azure Monitor’s distributed tracing

---

### 7. Reliability and Resilience

- Auto-Scaling:
    - Enable Horizontal Pod Autoscaler (HPA) and Cluster Autoscaler
- Self-Healing:
    - Use liveness, readiness, and startup probes
- Disaster Recovery:
    - Multi-region AKS with backup and restore (Velero)
    - Use Azure Backup for persistent volumes (Azure Disk)

---

### 8. CI/CD Integration

- GitOps: Use Flux or Argo CD to sync code from Git to the cluster
- Pipelines:
    - GitHub Actions or Azure DevOps for app and infra
    - Use OIDC auth with workload identity (no secrets)

---

### 9. Policy and Governance

- Enforce:
    - Tagging (team, cost center, environment)
    - Resource locks on critical components
    - Azure Policies to restrict SKUs, regions, public IPs
- Implement:
    - Terraform Sentinel or custom guardrails
    - Blueprints for organizational scaffolding

---

### 10. Backups and Updates

- Etcd Snapshots: Regular etcd backups if using self-managed control planes (not typical with AKS)
- Application Backup: Use Velero to back up workloads and persistent volumes
- Update Strategy:
    - Regularly update node pools
    - Automate with maintenance windows

---

## Security Appliances You Might Use

| Category               | Tool or Service                          |
|------------------------|------------------------------------------|
| Ingress Protection     | Azure Application Gateway (WAF), NGINX   |
| Egress Control         | Azure Firewall, NSG plus UDR             |
| Container Scanning     | Microsoft Defender for Containers, Trivy |
| Secrets Management     | Azure Key Vault plus CSI Driver          |
| Policy Enforcement     | Azure Policy, OPA Gatekeeper             |
| Admission Control      | Kyverno, OPA                             |
| Network Segmentation   | Network Policies (Calico, Azure native)  |
| Authentication         | Azure AD, Workload Identity              |
| Logging and Monitoring | Azure Monitor, Prometheus, Grafana       |
