## Cert-manager
This folder contain the  cert-manager manifest file for deploying cert-manager on your kubernetes cluster.

## steps to use this file 
- make sure you have the nessecary tools installed on your server
- then you use the 'kubectl create -f cert-manager.yml' to create or 'kubectl apply -f cert-manager' to apply the file on your cluster.
- then you use this command to verify if its deployed 'kubectl get pods --namespace cert-manager'.
- once you've checked and everything is fine and running, that means the creation of cert-manger is complete and you can start with letsencrypt.
