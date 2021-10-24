output "cluster_id" {
  description = "ID of the Kubernetes cluster"
  value       = module.oke.cluster_id
}

output "nodepool_ids" {
  description = "Map of Nodepool names and IDs"
  value       = module.oke.nodepool_ids
}

output "kubeconfig" {
  description = "convenient command to set KUBECONFIG environment variable before running kubectl locally"
  value       = "export KUBECONFIG=generated/kubeconfig"
}