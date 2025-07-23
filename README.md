# AKS Terraform Azure

This repository contains Terraform code to provision an Azure Kubernetes Service (AKS) cluster along with the required networking resources.

## 📁 Project Structure

```
aks-terraform/
├── main.tf          # Main Terraform configuration
├── variables.tf     # Input variables
├── outputs.tf       # Output values
└── .gitignore       # Git ignore rules
```

## ✅ What This Deploys

- Azure Resource Group
- Virtual Network and Subnet
- AKS Cluster with a default node pool
- Load Balancer (via AKS)
- Output values for `kube_config` and cluster name

## 🚀 How to Use

### 1. Install Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Git
- An active [Azure Subscription](https://portal.azure.com)

### 2. Authenticate to Azure

```bash
az login
```

### 3. Initialize and Apply Terraform

```bash
terraform init
terraform plan
terraform apply
```

> Type `yes` when prompted to create resources.

### 4. Get AKS Credentials

```bash
az aks get-credentials --resource-group aks-demo-rg --name aks-demo-cluster
kubectl get nodes
```

### 5. Deploy a Test App (Optional)

```bash
kubectl apply -f nginx-deployment.yaml
kubectl expose deployment nginx-deployment --type=LoadBalancer --port=80
```

## 🧹 Cleanup

To avoid ongoing charges:

```bash
terraform destroy
```

---

## 🛠 Variables

You can customize the deployment using a `terraform.tfvars` file:

```hcl
resource_group_name = "aks-demo-rg"
location            = "East US"
aks_cluster_name    = "aks-demo-cluster"
node_count          = 2
```

## 📌 Notes

- AKS is deployed using **Azure CNI** with a **Standard Load Balancer**
- Uses **SystemAssigned Identity**
- Easily extensible for RBAC, Azure Container Registry (ACR), autoscaling, etc.

## 👤 Author

Maram Manasa Reddy  
🔗 [LinkedIn](https://www.linkedin.com/in/marammanasareddy)

---

## 📷 Demo Screenshot (optional)

> _Add a screenshot here if you'd like to show the deployed AKS cluster or NGINX app._

---

## ✅ Next Steps (Optional Ideas)
- Add Ingress Controller + DNS
- Enable Azure Monitor / Container Insights
- Push Kubernetes manifests to `/k8s` folder