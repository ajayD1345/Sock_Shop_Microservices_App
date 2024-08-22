# Logging Stack Deployment

This folder contains the necessary manifests and configuration files to deploy a comprehensive logging stack on your Kubernetes cluster. The stack includes Elasticsearch for log storage and indexing, Fluentd for log collection and forwarding, and Kibana for visualizing the logs.

## Folder Structure

### elasticsearch/

The `elasticsearch` folder contains the manifests required to deploy Elasticsearch, responsible for storing and indexing logs collected from your Kubernetes cluster.

**Contents:**

- **`elasticsearch-deployment.yaml`:** Defines the Deployment for Elasticsearch, specifying the number of replicas, container image, and resource limits.
- **`elasticsearch-service.yaml`:** Exposes Elasticsearch via a Kubernetes Service, making it accessible within the cluster.
- **`elasticsearch-configmap.yaml`:** Contains configuration settings for Elasticsearch, such as cluster settings and JVM options.
- **`elasticsearch-pvc.yaml`:** Defines the PersistentVolumeClaim (PVC) for Elasticsearch to ensure data persistence.

### fluentd/

The `fluentd` folder contains the manifests necessary to deploy Fluentd, a data collector that gathers logs from various sources, processes them, and forwards them to Elasticsearch for storage.

**Contents:**

- **`fluentd-daemonset.yaml`:** Deploys Fluentd as a DaemonSet, ensuring that a Fluentd pod runs on each node in the cluster to collect logs from all nodes.
- **`fluentd-configmap.yaml`:** Contains the configuration for Fluentd, including input sources, filters, and output destinations.
- **`fluentd-service.yaml`:** Optionally exposes Fluentd via a Kubernetes Service, allowing it to receive logs from external sources if required.

### kibana/

The `kibana` folder contains the manifests needed to deploy Kibana, a visualization tool that allows you to explore and analyze logs stored in Elasticsearch.

**Contents:**

- **`kibana-deployment.yaml`:** Defines the Deployment for Kibana, specifying the number of replicas, container image, and resource limits.
- **`kibana-service.yaml`:** Exposes Kibana via a Kubernetes Service, making it accessible within the cluster or externally.
- **`kibana-configmap.yaml`:** Contains configuration settings for Kibana, such as Elasticsearch connection details and UI settings.
- **`kibana-ingress.yaml`:** (Optional) Defines an Ingress resource to expose Kibana via a domain name, enabling external access with SSL/TLS termination.

### common/

The `common` folder contains shared resources used by Elasticsearch, Fluentd, and Kibana, such as namespaces, service accounts, roles, and role bindings.

**Contents:**

- **`namespace.yaml`:** Creates the logging namespace where all the components of the logging stack will be deployed.
- **`serviceAccount.yaml`:** Defines the ServiceAccounts for Elasticsearch, Fluentd, and Kibana.
- **`role.yaml`:** Specifies the Roles required by the logging stack components to access Kubernetes resources.
- **`roleBinding.yaml`:** Binds the ServiceAccounts to the Roles, granting the necessary permissions.


## Conclusion

This folder contains everything you need to deploy a robust logging stack on Kubernetes, consisting of Elasticsearch for log storage, Fluentd for log collection and forwarding, and Kibana for log visualization. By following the deployment steps, you can quickly set up a logging solution that helps you monitor and troubleshoot your Kubernetes applications effectively.

