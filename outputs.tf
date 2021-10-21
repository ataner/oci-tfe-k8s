output "cluster_id" {
  description = "ID of the Kubernetes cluster"
  value       = module.oke.cluster_id
}

output "nodepool_ids" {
  description = "Map of Nodepool names and IDs"
  value       = module.oke.nodepool_ids
}

output "bastion_public_ip" {
  description = "public ip address of bastion host"
  value       = module.base.bastion_public_ip
}

output "operator_private_ip" {
  description = "private ip address of operator host"
  value       = module.base.operator_private_ip
}

output "ssh_to_operator" {
  description = "convenient command to ssh to the operator host"
  value       = module.base.ssh_to_operator
}

output "ssh_to_bastion" {
  description = "convenient command to ssh to the bastion host"
  value       = module.base.ssh_to_bastion
}

output "kubeconfig" {
  description = "convenient command to set KUBECONFIG environment variable before running kubectl locally"
  value       = "export KUBECONFIG=generated/kubeconfig"
}