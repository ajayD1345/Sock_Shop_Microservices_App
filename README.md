# Sock_Shop_Microservices_App

This project involves deploying a microservices-based web application called Sock Shop on Kubernetes using Infrastructure as Code (IaC) tools like Terraform and Ansible. The infrastructure is managed on Amazon Web Services (AWS) Elastic Kubernetes Service (EKS). Additionally, tools like Prometheus Stack and ECK Stack are used for monitoring and logging, while Cert-Manager and Let's Encrypt secure the application on the internet.

## Tools Used in This Project

- **AWS EKS (Amazon Web Services Elastic Kubernetes Service):** The cloud provider and service that manages the Kubernetes cluster.
- **Terraform and Ansible:** Used for creating IaC, configuration, and provisioning.
- **Prometheus Stack:** For monitoring the services.
- **ECK Stack:** For logging.

## Prerequisites

Before starting this project, ensure you have:

- A fully functioning AWS account and the AWS CLI installed on your server.
- Terraform
- Ansible
- Kubectl
- Helm
- Docker (Optional)

Once you have successfully installed all the necessary tools, you can begin deploying the project.

## Steps to Deploy the Capstone Project

### Step 1: Set Up the Infrastructure

Clone this repository using Git:

```bash
git clone https://github.com/ajayD1345/capstone_project.git
```
Change directory to the folder just cloned:

```bash
cd capstone_project
```
Next, create the necessary infrastructure by navigating to the Terraform directory and running the following commands:

```bash
cd terraform
terraform init
terraform apply
```
### Step 2: Deploy the Microservices Web App

After successfully creating the infrastructure, deploy your microservices web app and other tools to your cluster:

First, update your kubectl config to match your cluster's name and AWS region:

```bash
aws eks --region us-east-2 update-kubeconfig --name clusterbox
```
(Replace us-east-2 and clusterbox with your cluster's region and name.)

To confirm the update, check the nodes in your cluster:

```bash
kubectl get nodes
```
Once everything is confirmed, start the deployments:

Deploy Cert-Manager and Let's Encrypt:

```bash
cd cert-manager/
kubectl apply -f cert-manager.yml
```
After Cert-Manager is installed and working, deploy Let's Encrypt:

```bash
cd ../letsencrypt/
kubectl apply -f production-issuer.yml
```
This deploys Let's Encrypt, which creates free SSL/TLS certificates for HTTPS connections.

Next, deploy the Ingress Controller:

```bash
cd k8s/ingress/
kubectl apply -f ingress-controller/
```
Now when using the 'kubectl apply -f ingress-controller' command to apply the ingress-controller on your kubernetes cluster, you will see an output just like this;

```bash
clusterrole.rbac.authorization.k8s.io/ingress-nginx created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
ingressclass.networking.k8s.io/nginx created
namespace/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
role.rbac.authorization.k8s.io/ingress-nginx created
role.rbac.authorization.k8s.io/ingress-nginx-admission created
serviceaccount/ingress-nginx created
serviceaccount/ingress-nginx-admission created
service/ingress-nginx-controller created
service/ingress-nginx-controller-admission created
Error from server (NotFound): error when creating "ingress-nginx_config.yml": namespaces "ingress-nginx" not found
Error from server (NotFound): error when creating "ingress-nginx_dep.yml": namespaces "ingress-nginx" not found
Error from server (NotFound): error when creating "ingress-nginx_job.yml": namespaces "ingress-nginx" not found
Error from server (NotFound): error when creating "ingress-nginx_job.yml": namespaces "ingress-nginx" not found
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created
```
In this output there are errors of namepace not found, In other to fix this error just run this command again and it will solve the error problem;

```bash
kubectl apply -f ingress-controller/
```
    or
If you encounter a "namespace not found" error, run the command again or create the namespace first:

```bash
kubectl creates namespace ingress-nginx # after this is created, then you can run the other command
kubectl apply -f ingress-controller/
```
this step creates the namespace first, hereby preventing the error ouput.

Confirm the successful deployment by checking the pods in the ingress-nginx namespace:

```bash
kubectl get pods -n ingress-nginx
```
Then, deploy the Sock Shop microservices web app:

```bash
cd ../deployments/
kubectl apply -f manifests/
```
Finally, deploy the Sock Shop Ingress file to route external HTTP/HTTPS traffic:

```bash
cd ../ingress/
kubectl apply -f sock-shop-ingress.yml
```
Now you can access the Sock Shop app on your registered domain name.

### Step 3: Deploy Monitoring and Logging Tools
First, create the kube-prometheus-crd folder, which contains custom resources for the kube-prometheus-dep folder to work:

```bash
cd ../monitoring/
kubectl create -f kube-prometheus-crd/
```
Once created, deploy the other components:

```bash
kubectl create -f kube-prometheus-dep/
```
Deploy the Ingress file to route external traffic to the monitoring tools:

```bash
kubectl apply -f ingress.yml
```
Access the services using your registered domain name, similar to the Sock Shop app.

For logging, deploy the EFK Stack:

```bash
cd ../logging/efk-logging
kubectl create -f .
```
This deploys the EFK logging stack, which provides logging tools for the Sock Shop web app, accessible via the domain name specified in the ingress.yml file in the efk-logging folder.

### Step 4: Clean Up

Once you are done and have confirmed everything works, delete the infrastructure with the following command:

```bash
cd terraform
terraform destroy
```

# Conclusion
Once you have successfully deployed the right files and folders and can access them in your browser, it means you have deployed the services correctly and completed the project.

