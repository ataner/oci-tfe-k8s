module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.0.0"

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = var.label_prefix

  # gateways
  create_internet_gateway  = true
  create_nat_gateway       = var.worker_type == "private" || var.create_operator == true || (var.load_balancers == "internal" || var.load_balancers == "both") ? true : false
  create_service_gateway   = true
  nat_gateway_public_ip_id = var.nat_gateway_public_ip_id

  # drg
  create_drg       = var.create_drg
  drg_display_name = var.drg_display_name

  # lpgs
  local_peering_gateways = var.local_peering_gateways

  # freeform_tags
  freeform_tags = var.freeform_tags["vcn"]

  # vcn
  vcn_cidrs                    = var.vcn_cidrs
  vcn_dns_label                = var.vcn_dns_label
  vcn_name                     = var.vcn_name
  lockdown_default_seclist     = var.lockdown_default_seclist
  internet_gateway_route_rules = var.internet_gateway_route_rules
  nat_gateway_route_rules      = var.nat_gateway_route_rules

}

module "oke" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "4.0.0"

  compartment_id = var.compartment_id
  tenancy_id     = var.tenancy_ocid
  user_id        = var.user_ocid


  ssh_private_key = var.ssh_private_key
  ssh_public_key  = var.ssh_public_key

  label_prefix = var.label_prefix
  region       = var.region
  home_region  = var.region

  vcn_dns_label = var.vcn_dns_label
  vcn_name      = var.vcn_name

  bastion_shape    = var.bastion_shape
  bastion_timezone = var.bastion_timezone

  create_bastion_host                   =   var.create_bastion_host

  create_operator                       =   var.create_operator

  operator_shape    = var.operator_shape
  operator_timezone = var.operator_timezone

  providers = {
    oci.home = oci.home
  }
}