InnovateMart EKS Deployment – Deployment & Architecture Guide
1. Architecture Overview

The InnovateMart app runs on Amazon EKS, provisioned with Terraform and deployed via GitHub Actions CI/CD.

Terraform → VPC, IAM roles, EKS, S3 + DynamoDB backend.

GitHub Actions → Automates Terraform (init/plan/apply) and Kubernetes deployments.

Kubernetes → Hosts microservices: Catalog, Carts, Orders, Checkout, UI.

Flow: Developer push → Pipeline → Terraform infra → EKS ready → Manifests patched → App deployed → UI exposed via LoadBalancer.

2. Accessing the Application

Get the app endpoint:

kubectl get svc ui -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'


Open the hostname in a browser to access InnovateMart.

3. Read-Only Developer Access

Console Login:

https://<your-account-alias>.signin.aws.amazon.com/console


User: dev-readonly (credentials provided separately).

Kubeconfig Setup:

aws eks update-kubeconfig --name innovatemart-cluster --region us-east-1 --profile dev-readonly
kubectl get pods --all-namespaces


This grants read-only cluster visibility.

4. Bonus Objectives

Remote State → S3 + DynamoDB (secure collaboration).

Branch Logic → feature/* → terraform plan; main/master → terraform apply.

Secrets Injection → Terraform outputs → manifests via envsubst.

Cluster Readiness Check → Waits for EKS to be active.

Validation → Confirms pods/services post-deployment.

5. Conclusion

The pipeline delivers end-to-end automation: secure infra provisioning, controlled deployments, and reliable app delivery on EKS. Developers get safe read-only IAM access, while production remains consistent, auditable, and fully automated.