output "cluster_id" {
  description = "ID of the Kubernetes cluster"
  value       = module.oke.cluster_id
}

output "nodepool_ids" {
  description = "Map of Nodepool names and IDs"
  value       = module.oke.nodepool_ids
}

output "ssh_to_operator" {
  description = "convenient command to ssh to the operator host"
  value       = "ssh -i ${var.ssh_private_key_path} -J opc@${local.bastion_public_ip} opc@${local.operator_private_ip}"
}

output "ssh_to_bastion" {
  description = "convenient command to ssh to the bastion host"
  value       = "ssh -i ${var.ssh_private_key_path} opc@${local.bastion_public_ip}"
}