terraform {
  required_providers {
    oci = { source = "hashicorp/oci" }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  region       = var.region
}

module "oke" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "latest"

  compartment_id = var.compartment_id
  tenancy_id     = var.tenancy_ocid
  user_id        = var.user_ocid

  ssh_private_key = var.ssh_private_key
  ssh_public_key  = var.ssh_public_key

  label_prefix = var.label_prefix
  region       = var.region

  vcn_dns_label = var.vcn_dns_label
  vcn_name      = var.vcn_name

  bastion_shape    = var.bastion_shape
  bastion_timezone = var.bastion_timezone

  operator_shape    = var.operator_shape
  operator_timezone = var.operator_timezone

}