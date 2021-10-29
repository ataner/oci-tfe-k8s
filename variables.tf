variable "tenancy_ocid" {
  type        = string
  description = "OCID for tenancy"
  default     = "ocid1.tenancy.oc1..1234567890"
}
variable "user_ocid" {
  type        = string
  description = "OCID for User"
  default     = "ocid1.user.oc1..1234567890"
}
variable "fingerprint" {
  type        = string
  description = "Key fingerprint"
  default     = "AA:BB:CC:DD:EE:FF"
}
variable "private_key" {
  type        = string
  description = "Private Key"
}
variable "region" {
  type        = string
  description = "OC Region"
  default     = ""
}

variable "compartment_id" {
  description = "The compartment id where to create all resources."
  type        = string
  default     = "ocid1.compartment.oc1..1234567890"
}

# ssh keys
variable "ssh_private_key" {
  description = "The ssh private key"
  type        = string
}

variable "ssh_public_key" {
  default     = ""
  description = "The ssh public key."
  type        = string
}

# oke specific 

variable "label_prefix" {
  default     = "none"
  description = "A string that will be prepended to all resources."
  type        = string
}

variable "vcn_name" {
  default     = "oke-vcn"
  description = "name of vcn"
  type        = string
}

variable "vcn_dns_label" {
  default     = "oke"
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet."
  type        = string
}

# bastion 

variable "create_bastion_host" {
  default     = true
  description = "Whether to create a bastion host."
  type        = bool
}

variable "bastion_shape" {
  default = {
    # shape = "VM.Standard.E2.2"
    shape            = "VM.Standard.E3.Flex",
    ocpus            = 1,
    memory           = 4,
    boot_volume_size = 50
  }
  description = "The shape of bastion instance."
  type        = map(any)
}

variable "bastion_timezone" {
  default     = "Americas/New York"
  description = "The preferred timezone for the bastion host."
  type        = string
}

# operator variables

variable "create_operator" {
  default     = true
  description = "Whether to create an operator server in a private subnet."
  type        = bool
}

variable "operator_shape" {
  default = {
    # shape = "VM.Standard.E2.2"
    shape            = "VM.Standard.E3.Flex",
    ocpus            = 1,
    memory           = 4,
    boot_volume_size = 50
  }
  description = "The shape of operator instance."
  type        = map(any)
}

variable "operator_timezone" {
  default     = "America/New York"
  description = "The preferred timezone for the operator host."
  type        = string
}

# vcn parameters
variable "create_drg" {
  description = "whether to create Dynamic Routing Gateway. If set to true, creates a Dynamic Routing Gateway and attach it to the VCN."
  type        = bool
  default     = false
}

variable "drg_display_name" {
  description = "(Updatable) Name of Dynamic Routing Gateway. Does not have to be unique."
  type        = string
  default     = "drg"
}

variable "internet_gateway_route_rules" {
  description = "(Updatable) List of routing rules to add to Internet Gateway Route Table"
  type        = list(map(string))
  default     = null
}

variable "local_peering_gateways" {
  description = "Map of Local Peering Gateways to attach to the VCN."
  type        = map(any)
  default     = null
}

variable "lockdown_default_seclist" {
  description = "whether to remove all default security rules from the VCN Default Security List"
  default     = true
  type        = bool
}

variable "nat_gateway_route_rules" {
  description = "(Updatable) List of routing rules to add to NAT Gateway Route Table"
  type        = list(map(string))
  default     = null
}

variable "nat_gateway_public_ip_id" {
  description = "OCID of reserved IP address for NAT gateway. The reserved public IP address needs to be manually created."
  default     = "none"
  type        = string
}

variable "subnets" {
  description = "parameters to cidrsubnet function to calculate subnet masks within the VCN."
  default = {
    bastion  = { netnum = 0, newbits = 13 }
    operator = { netnum = 1, newbits = 13 }
    cp       = { netnum = 2, newbits = 13 }
    int_lb   = { netnum = 16, newbits = 11 }
    pub_lb   = { netnum = 17, newbits = 11 }
    workers  = { netnum = 1, newbits = 2 }
  }
  type = map(any)
}

variable "vcn_cidrs" {
  default     = ["10.0.0.0/16"]
  description = "The list of IPv4 CIDR blocks the VCN will use."
  type        = list(string)
}

variable "worker_type" {
  default     = "private"
  description = "Whether to provision public or private workers."
  type        = string
  validation {
    condition     = contains(["public", "private"], var.worker_type)
    error_message = "Accepted values are public or private."
  }
}

variable "load_balancers" {
  # values: both, internal, public
  default     = "public"
  description = "The type of subnets to create for load balancers."
  type        = string
  validation {
    condition     = contains(["public", "internal", "both"], var.load_balancers)
    error_message = "Accepted values are public, internal or both."
  }
}

# tagging
variable "freeform_tags" {
  default = {
    # vcn, bastion and operator tags are required
    # add more tags in each as desired
    vcn = {
      environment = "dev"
    }
    bastion = {
      environment = "dev"
      role        = "bastion"
    }
    operator = {
      environment = "dev"
      role        = "operator"
    }
  }
  description = "Tags to apply to different resources."
  type        = map(any)
}