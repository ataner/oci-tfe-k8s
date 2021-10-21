# oci-tfe-k8s
POC for OKE using TFC. So many 3-letter acronyms. WTF OMG BBQ LOL!!!111
<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oke"></a> [oke](#module\_oke) | oracle-terraform-modules/oke/oci | 4.0.0-RC1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_shape"></a> [bastion\_shape](#input\_bastion\_shape) | The shape of bastion instance. | `map(any)` | <pre>{<br>  "boot_volume_size": 50,<br>  "memory": 4,<br>  "ocpus": 1,<br>  "shape": "VM.Standard.E3.Flex"<br>}</pre> | no |
| <a name="input_bastion_timezone"></a> [bastion\_timezone](#input\_bastion\_timezone) | The preferred timezone for the bastion host. | `string` | `"Americas/New York"` | no |
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | The compartment id where to create all resources. | `string` | n/a | yes |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | Key fingerprint | `string` | n/a | yes |
| <a name="input_label_prefix"></a> [label\_prefix](#input\_label\_prefix) | A string that will be prepended to all resources. | `string` | `"none"` | no |
| <a name="input_operator_shape"></a> [operator\_shape](#input\_operator\_shape) | The shape of operator instance. | `map(any)` | <pre>{<br>  "boot_volume_size": 50,<br>  "memory": 4,<br>  "ocpus": 1,<br>  "shape": "VM.Standard.E3.Flex"<br>}</pre> | no |
| <a name="input_operator_timezone"></a> [operator\_timezone](#input\_operator\_timezone) | The preferred timezone for the operator host. | `string` | `"America/New York"` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Private Key | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | OC Region | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | The ssh private key | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | The ssh public key. | `string` | `""` | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCID for tenancy | `string` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | OCID for User | `string` | n/a | yes |
| <a name="input_vcn_dns_label"></a> [vcn\_dns\_label](#input\_vcn\_dns\_label) | A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet. | `string` | `"oke"` | no |
| <a name="input_vcn_name"></a> [vcn\_name](#input\_vcn\_name) | name of vcn | `string` | `"oke-vcn"` | no |

## Outputs

No outputs.

<!--- END_TF_DOCS --->