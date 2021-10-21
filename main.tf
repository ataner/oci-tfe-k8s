module "oke" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "4.0.0-RC1"

  compartment_id = var.compartment_id
  tenancy_id     = var.tenancy_ocid
  user_id        = var.user_ocid

  ssh_private_key = var.ssh_private_key
  ssh_public_key  = var.ssh_public_key

  label_prefix = var.label_prefix
  region       = var.region
  home_region       = var.region

  vcn_dns_label = var.vcn_dns_label
  vcn_name      = var.vcn_name

  bastion_shape    = var.bastion_shape
  bastion_timezone = var.bastion_timezone

  operator_shape    = var.operator_shape
  operator_timezone = var.operator_timezone

  providers = {
    oci.home = oci.home
  }
}