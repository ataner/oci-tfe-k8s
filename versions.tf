terraform {
  required_providers {
    oci = {
      source                = "hashicorp/oci"
      configuration_aliases = [oci.home]
    }
  }
  required_version = ">= 1.0.0"
}