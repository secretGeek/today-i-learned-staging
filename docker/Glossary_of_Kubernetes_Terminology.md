# Glossary of Kubernetes Terminology

## Kubernetes Architecture

- **Kubernetes (K8s)**: An open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.
- **Cluster**: A set of nodes (machines) that run containerized applications managed by Kubernetes. A Kubernetes cluster has a control plane (master node) and worker nodes.
- **Node**: A machine (physical or virtual) in a Kubernetes cluster. It can be a master node (control plane) or a worker node that runs the actual application workloads.
- **Control Plane**: The set of components that manage the state of the Kubernetes cluster, including scheduling, API access, and managing the desired state of the system.

## Kubernetes Core Objects

- **Pod**: The smallest and simplest Kubernetes object, representing a single instance of a running process in a cluster. A pod can run one or more containers.
- **Deployment**: A controller in Kubernetes that manages the desired state of pods and replicates them as needed. It ensures that a certain number of identical pods are running at all times.
- **ReplicaSet**: Ensures that a specific number of pod replicas are running at any given time. Deployments usually manage ReplicaSets.
- **Service**: An abstraction that defines a logical set of pods and a policy for accessing them. Kubernetes services allow stable endpoints for a set of dynamic pods.
  - **ClusterIP**: The default service type that exposes the service on a cluster-internal IP.
  - **NodePort**: Exposes the service on each node's IP at a static port.
  - **LoadBalancer**: Exposes the service using a cloud provider's load balancer.

## Advanced Kubernetes Concepts

- **ConfigMap**: An object that stores non-sensitive configuration data in key-value pairs. Pods can use ConfigMaps to retrieve configuration details at runtime.
- **Secret**: Similar to ConfigMaps but used to store sensitive information like passwords, tokens, or keys.
- **Persistent Volume (PV)**: A piece of storage that has been provisioned by an administrator or dynamically provisioned using storage classes. It is abstracted from the underlying storage system.
- **Persistent Volume Claim (PVC)**: A request for storage by a user. Pods use PVCs to consume storage resources.
- **StatefulSet**: A Kubernetes controller that is used to manage stateful applications. Unlike Deployments, StatefulSets ensure that pods are created and deleted in a predictable order.
- **DaemonSet**: Ensures that a copy of a pod is running on all (or some) nodes in the cluster.
- **Job**: A Kubernetes object used to run tasks that are expected to terminate after completion. Jobs ensure that a specified number of pods successfully complete the task.
- **CronJob**: A Kubernetes object for running jobs on a time-based schedule, similar to cron jobs in Linux.

## Kubernetes Scheduling and Scaling

- **Scheduler**: A Kubernetes control plane component responsible for assigning pods to nodes based on resource requirements and constraints.
- **Horizontal Pod Autoscaler (HPA)**: Automatically scales the number of pod replicas in a deployment or ReplicaSet based on CPU utilization or other select metrics.
- **Taints and Tolerations**: Taints allow a node to repel specific pods, while tolerations enable pods to tolerate those taints and still be scheduled on the nodes.

## Kubernetes Networking and Security

- **Ingress**: An API object that manages external access to services in a cluster, typically via HTTP/HTTPS routing.
- **Ingress Controller**: The controller that watches Ingress resources and manages the HTTP load balancing and routing.
- **Service Mesh**: A dedicated infrastructure layer that controls service-to-service communication, making it observable, secure, and resilient. Popular service meshes include Istio and Linkerd.
- **Role-Based Access Control (RBAC)**: A method of regulating access to resources in Kubernetes based on the roles of individual users within your cluster.

## See also

- [Glossary of Docker and Container Terminology](Glossary_of_Docker_and_Container_Terminology.md)
- [Lesson Plan for Mastering Containers, Docker, and Kubernetes](Lesson_Plan_for_Mastering_Containers_Docker_and_Kubernetes.md)
