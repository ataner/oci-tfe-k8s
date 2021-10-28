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