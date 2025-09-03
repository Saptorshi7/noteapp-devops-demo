# Note App React Project 🚀

A simple **React-based Note Taking App** containerized with **Docker**, deployed to **Azure Kubernetes Service (AKS)**, and fully automated using **Terraform** and **GitHub Actions**.

---

## 📌 Features
- React-based UI for creating and managing notes
- Containerized using **Docker**
- Infrastructure provisioned using **Terraform**
- Deployment managed via **GitHub Actions Pipelines**
- Docker images stored in **Azure Container Registry (ACR)**
- Secure CI/CD with:
  - **Trivy** → Docker image vulnerability scanning
  - **Checkov** → Terraform code security scanning
- Branch protection: code changes allowed only via Pull Requests (PRs)

---

## 🏗️ Project Structure
```bash
.
├── infra/                  # Terraform code for AKS, ACR, networking, etc.
│   ├── main.tf
│   ├── backend.tf
│   └── providers.tf
├── app/                    # React app source code
│   ├── public/             # Static assets
│   ├── src/
│   ├── tests/
│   ├── Dockerfile          # Multi-stage Docker build
│   ├── index.html
│   ├── nginx.conf
│   ├── package.json
│   └── vite.config.js
├── k8s/
│   ├── namespace.yml
│   ├── deployment.yml
│   ├── service.yml
│   └── hpa.yml                           
├── .github/workflows/      # GitHub Actions pipelines
│   ├── tf-plan.yml
│   ├── tf-apply.yml
│   ├── tf-destroy.yml
│   ├── docker-build.yml
│   └── deploy-k8s.yml
└── README.md               # Project documentation
```

## ⚙️ Prerequisites
- Node.js 18+
- Docker
- Terraform
- Azure CLI
- GitHub CLI

---

## 🚀 Local Development
Clone the repo:
```bash
git clone https://github.com/mahdi-q/Note-App-React-Project.git
cd Note-App-React-Project
```

Install dependencies:
```bash
npm install
```

Run locally:
```bash
npm start
```

App runs on: http://localhost:3000

---

## 🐳 Docker Build & Run
Build Docker image:
```bash
docker build -t note-app .
```

Run container:
```bash
docker run -d -p 8080:80 note-app
```
Visit: http://localhost:8080

---

## ☁️ Infrastructure Deployment

Navigate to infra folder:
```bash
cd infra
```

Initialize Terraform:
```bash
terraform init
```

Plan:
```bash
terraform plan
```

Apply:
```bash
terraform apply
```

Resources created:
- Azure Container Registry (ACR)
- Azure Kubernetes Service (AKS)
- Networking resources (VNet, Subnets, NSGs)

---

## 🔄 CI/CD Workflows
GitHub Actions pipelines are defined in .github/workflows/:
- **Terraform Plan** → Runs on PRs to main, scans with Checkov
- **Terraform Apply** → Runs after merge to main, provisions infra
- **Terraform Destroy** → Manually triggered workflow
- **Docker Build & Push** → Builds and pushes app image to ACR
- **Deployment to AKS** → Deploys latest image to AKS

---

## 🔒 Security
- **Trivy** scans Docker images for vulnerabilities
- **Checkov** scans Terraform for misconfigurations

Branch protection enabled:
- No direct pushes to main
- PR approval required
- Terraform Plan must pass before merge

---

## 🛠️ Rollback
Rollback is supported by:
- terraform destroy workflow (manual trigger)
- Previous Docker image versions stored in ACR
- GitHub Actions manual workflow dispatch for redeployments