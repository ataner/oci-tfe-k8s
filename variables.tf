variable "tenancy_ocid" {
  type        = string
  description = "OCID for tenancy"
}
variable "user_ocid" {
  type        = string
  description = "OCID for User"
}
variable "fingerprint" {
  type        = string
  description = "Key fingerprint"
}
variable "private_key" {
  type        = string
  description = "Private Key"
}
variable "region" {
  type        = string
  description = "OC Region"
}

variable "compartment_id" {
  description = "The compartment id where to create all resources."
  type        = string
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