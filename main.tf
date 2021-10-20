terraform {  
    required_providers {    
        oci = {      source = "hashicorp/oci"    }  
        }
}
        
provider "oci" {
    tenancy_ocid = "${var.tenancy_ocid}"
    user_ocid = "${var.user_ocid}"
    fingerprint = "${var.fingerprint}"
    private_key_path = "${var.private_key_path}"
    region = "${var.region}"
}

resource "oci_core_vcn" "internal" {  
    dns_label      = "internal"  
    cidr_block     = "172.16.0.0/20"  
    compartment_id = "<your_compartment_OCID_here>"  
    display_name   = "My internal VCN"
    }