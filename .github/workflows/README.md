# Deploy Sock-shop on Amazon kubernetes service (AWS AKS) Workflow

This GitHub Actions workflow file automates the deployment of Sock-shop, a microservices-based demo application, onto Elastic kubernetes service (EKS). The workflow allows for both building and cleaning up the deployment environment based on user input.

## Overview of GitHub Actions

GitHub Actions is a feature of GitHub that enables continuous integration (CI) and continuous deployment (CD) workflows directly within your GitHub repository. With GitHub Actions, you can automate tasks, build, test, and deploy your code directly from GitHub.

## Workflow Details

### Workflow Trigger

This workflow is triggered manually using the `workflow_dispatch` event, allowing users to choose between two actions: `build` and `cleanup`. The `build` action deploys the Sock-shop application, while the `cleanup` action removes the deployed resources.

### Permissions

The workflow requires specific permissions to interact with the repository's contents and obtain an identity token for necessary operations.

### Jobs

The workflow consists of two main jobs:

1. **Deploy Job**: This job runs on an Ubuntu environment (`ubuntu-latest`) and executes the deployment steps when triggered with the `build` action.

2. **Cleanup Job**: This job runs when triggered with the `cleanup` action and destroys the deployed infrastructure to clean up resources.

### Steps

#### Deploy Job Steps

1. **Checkout Code**: Checks out the repository's code using the `actions/checkout@v2` action.

2. **Install Amazon CLI**: Installs the Amazon CLI if the action is set to `build`.

3. **Install Necessary Tools**: Installs necessary tools like `curl`, `unzip`, `wget`, etc., required for deployment.

4. **Install Terraform**: Installs Terraform for managing infrastructure as code.

5. **Install kubectl**: Installs `kubectl` to interact with Kubernetes clusters.

7. **Aamzon Login**: Logs in to Amazon using the Amazon CLI.

8. **Terraform Setup and Apply/Destroy (Infrastructure)**: Initializes and applies Terraform configurations for terraform provisioning or destruction.

9. **Wait for Kubernetes Cluster to be Ready**: Adds a delay to ensure the Kubernetes cluster is ready before proceeding.

10. **Get EKS Credentials**: Retrieves EKS credentials to interact with the Kubernetes cluster.

12. **Apply manifest yml**: Applies YAML files for deploying microservices.

13. **Apply letsencrypt yml**: Applies YAML files for Let's Encrypt.

14. **Apply nginx-ingress-controller yml**: Applies NGINX Ingress controller YAML.

15. **Wait for nginx-ingress-controller yml to be Ready**: Adds a delay to ensure NGINX Ingress is ready before proceeding.

16. **Apply Sock-shop-ingress yml in Ingress Directory**: Applies YAML files for deploying Sock-shop.

17. **Apply kube-prometheus-stack**: Applies YAML files for deploying Prometheus stack components.

20. **Apply elk-logging yml**: Applies YAML files for deploying ELK Stack components.

#### Cleanup Job Steps

1. **Clean Up**: Destroys infrastructure using Terraform if triggered with the `cleanup` action.

## Applying Configuration

To apply this workflow configuration:

1. Create a new GitHub repository or use an existing one.

2. Make sure you have all the files and directories required for the deployment in your repository.

3. Go to the "Actions" tab in your repository and click on "Set up a workflow yourself" to create a new workflow file.

4. Copy the contents of the `main.yml` file from this repository and paste it into the new workflow file.

5. Trigger the workflow manually by navigating to the Actions tab in your GitHub repository, selecting the workflow, and choosing the desired action (build or cleanup) from the dropdown menu.

6. Monitor the workflow execution for any errors or failures.

By following these steps, you can effectively deploy and manage the Sock-shop application on Elastic Kubernetes Service using GitHub Actions.

## Screenshots

### Workflow Dispatch with Build Action

![Workflow Dispatch with Build Action](.img/workflowbuildaction.png)

![Workflow Dispatch with Build Action](.img/job.png)

![Workflow Dispatch with Build Action](.img/steps.png)

### Workflow Dispatch with Cleanup Action

![Workflow Dispatch with Cleanup Action](.img/workflowcleanupaction.png)
