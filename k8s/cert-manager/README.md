## Cert-Manager

This folder contains the manifest file for deploying Cert-Manager on your Kubernetes cluster.

### Steps to Use This File

1. **Ensure Prerequisites:** Make sure you have the necessary tools installed on your server.
   
2. **Deploy Cert-Manager:**
   Use the following command to create or apply the Cert-Manager manifest:

   ```bash
   kubectl apply -f cert-manager.yml
   ```
   Alternatively, you can use:

   ```bash
   kubectl create -f cert-manager.yml
   ```
3. Verify Deployment:
Check the status of Cert-Manager to ensure it is deployed correctly:

```bash
kubectl get pods --namespace cert-manager
```
# Completion
Once you confirm that all pods are running as expected, the deployment of Cert-Manager is complete. You can then proceed to deploy Let's Encrypt.
