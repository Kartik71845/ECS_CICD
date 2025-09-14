# ECS CI/CD Project

This project demonstrates a **complete CI/CD pipeline using GitHub Actions, Docker, AWS ECR, and ECS (Fargate)**. The pipeline automatically builds a Docker image, pushes it to Amazon ECR, and deploys it to an ECS service.

---

## **Project Overview**

- **CI/CD Tool:** GitHub Actions  
- **Containerization:** Docker  
- **Registry:** Amazon ECR  
- **Deployment:** Amazon ECS (Fargate)  
- **Branch Trigger:** `master` (change to `main` if needed)  
- **Port:** 3000  

---

## **Pipeline Workflow**

1. **Code pushed to GitHub** triggers the workflow.
2. Workflow **checks out the repository** and installs dependencies.
3. **Builds Docker image** from the repository.
4. **Logs in to AWS ECR** using GitHub Secrets.
5. **Tags and pushes the Docker image** to ECR.
6. **Updates ECS service** to deploy the new image (forces new deployment).

---

## **AWS Setup**

### **1. ECR Repository**
- Name: `ecs-cicd-app`  
- Region: `us-east-1`  
- Stores Docker images for ECS deployment.

### **2. ECS Cluster**
- Name: `ecs-cicd-cluster`  
- Launch type: Fargate  

### **3. ECS Service**
- Name: `ecs-cicd-service`  
- Container port: 3000  
- Public IP: Enabled (tasks are accessible via public IP)  

### **4. IAM User**
- Permissions:
  - ECR: Push/Pull images  
  - ECS: Update service, register task definitions  
  - IAM: Pass role  

- GitHub secrets used in workflow:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_ACCOUNT_ID`

---

## **GitHub Actions Workflow**

- Workflow file: `.github/workflows/ecs-cicd.yml`
- Runs on:
  - `push` to `master`
  - Manual trigger (`workflow_dispatch`)
- Steps:
  1. Checkout repository  
  2. Set up Node.js  
  3. Install dependencies & run tests  
  4. Build Docker image  
  5. Log in to ECR  
  6. Tag & push Docker image  
  7. Update ECS service

---

## **Accessing the Application**

Since no Load Balancer is used:

1. Go to **ECS → Clusters → Tasks → Running Task → ENI/Public IP**  
2. Open in browser:  
