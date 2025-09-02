# lab_assignment_Topic_4

# 📒 Note App – Cloud Native Deployment

This project demonstrates a **React-based Note Taking Application** that is containerized with **Docker** and deployed on **Azure Kubernetes Service (AKS)**.  
The infrastructure is provisioned with **Terraform**, and CI/CD workflows are automated using **GitHub Actions**.  
Docker images are stored securely in **Azure Container Registry (ACR)**.

---

## 🚀 Project Architecture

1. **Frontend**: React.js application (served via Nginx).
2. **Containerization**: Docker multi-stage build.
3. **Registry**: Azure Container Registry (ACR).
4. **Orchestration**: Azure Kubernetes Service (AKS).
5. **IaC**: Terraform manages AKS, ACR, networking, and related infra.
6. **CI/CD**: GitHub Actions automates:
   - Terraform Plan/Apply/Destroy  
   - Docker Build & Push  
   - Deployment to AKS  
   - Security scanning with **Trivy** (Docker images) and **Checkov** (Terraform code).

---

## 📂 Project Structure