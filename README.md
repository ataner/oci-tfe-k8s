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
| <a name="module_oke"></a> [oke](#module\_oke) | oracle-terraform-modules/oke/oci | 4.0.0 |
| <a name="module_vcn"></a> [vcn](#module\_vcn) | oracle-terraform-modules/vcn/oci | 3.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_shape"></a> [bastion\_shape](#input\_bastion\_shape) | The shape of bastion instance. | `map(any)` | <pre>{<br>  "boot_volume_size": 50,<br>  "memory": 4,<br>  "ocpus": 1,<br>  "shape": "VM.Standard.E3.Flex"<br>}</pre> | no |
| <a name="input_bastion_timezone"></a> [bastion\_timezone](#input\_bastion\_timezone) | The preferred timezone for the bastion host. | `string` | `"Americas/New York"` | no |
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | The compartment id where to create all resources. | `string` | `"ocid1.compartment.oc1..1234567890"` | no |
| <a name="input_create_bastion_host"></a> [create\_bastion\_host](#input\_create\_bastion\_host) | Whether to create a bastion host. | `bool` | `true` | no |
| <a name="input_create_drg"></a> [create\_drg](#input\_create\_drg) | whether to create Dynamic Routing Gateway. If set to true, creates a Dynamic Routing Gateway and attach it to the VCN. | `bool` | `false` | no |
| <a name="input_create_operator"></a> [create\_operator](#input\_create\_operator) | Whether to create an operator server in a private subnet. | `bool` | `true` | no |
| <a name="input_drg_display_name"></a> [drg\_display\_name](#input\_drg\_display\_name) | (Updatable) Name of Dynamic Routing Gateway. Does not have to be unique. | `string` | `"drg"` | no |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | Key fingerprint | `string` | `"AA:BB:CC:DD:EE:FF"` | no |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | Tags to apply to different resources. | `map(any)` | <pre>{<br>  "bastion": {<br>    "environment": "dev",<br>    "role": "bastion"<br>  },<br>  "operator": {<br>    "environment": "dev",<br>    "role": "operator"<br>  },<br>  "vcn": {<br>    "environment": "dev"<br>  }<br>}</pre> | no |
| <a name="input_internet_gateway_route_rules"></a> [internet\_gateway\_route\_rules](#input\_internet\_gateway\_route\_rules) | (Updatable) List of routing rules to add to Internet Gateway Route Table | `list(map(string))` | `null` | no |
| <a name="input_label_prefix"></a> [label\_prefix](#input\_label\_prefix) | A string that will be prepended to all resources. | `string` | `"none"` | no |
| <a name="input_load_balancers"></a> [load\_balancers](#input\_load\_balancers) | The type of subnets to create for load balancers. | `string` | `"public"` | no |
| <a name="input_local_peering_gateways"></a> [local\_peering\_gateways](#input\_local\_peering\_gateways) | Map of Local Peering Gateways to attach to the VCN. | `map(any)` | `null` | no |
| <a name="input_lockdown_default_seclist"></a> [lockdown\_default\_seclist](#input\_lockdown\_default\_seclist) | whether to remove all default security rules from the VCN Default Security List | `bool` | `true` | no |
| <a name="input_nat_gateway_public_ip_id"></a> [nat\_gateway\_public\_ip\_id](#input\_nat\_gateway\_public\_ip\_id) | OCID of reserved IP address for NAT gateway. The reserved public IP address needs to be manually created. | `string` | `"none"` | no |
| <a name="input_nat_gateway_route_rules"></a> [nat\_gateway\_route\_rules](#input\_nat\_gateway\_route\_rules) | (Updatable) List of routing rules to add to NAT Gateway Route Table | `list(map(string))` | `null` | no |
| <a name="input_operator_shape"></a> [operator\_shape](#input\_operator\_shape) | The shape of operator instance. | `map(any)` | <pre>{<br>  "boot_volume_size": 50,<br>  "memory": 4,<br>  "ocpus": 1,<br>  "shape": "VM.Standard.E3.Flex"<br>}</pre> | no |
| <a name="input_operator_timezone"></a> [operator\_timezone](#input\_operator\_timezone) | The preferred timezone for the operator host. | `string` | `"America/New York"` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Private Key | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | OC Region | `string` | `""` | no |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | The ssh private key | `string` | n/a | yes |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | The ssh public key. | `string` | `""` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | parameters to cidrsubnet function to calculate subnet masks within the VCN. | `map(any)` | <pre>{<br>  "bastion": {<br>    "netnum": 0,<br>    "newbits": 13<br>  },<br>  "cp": {<br>    "netnum": 2,<br>    "newbits": 13<br>  },<br>  "int_lb": {<br>    "netnum": 16,<br>    "newbits": 11<br>  },<br>  "operator": {<br>    "netnum": 1,<br>    "newbits": 13<br>  },<br>  "pub_lb": {<br>    "netnum": 17,<br>    "newbits": 11<br>  },<br>  "workers": {<br>    "netnum": 1,<br>    "newbits": 2<br>  }<br>}</pre> | no |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCID for tenancy | `string` | `"ocid1.tenancy.oc1..1234567890"` | no |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | OCID for User | `string` | `"ocid1.user.oc1..1234567890"` | no |
| <a name="input_vcn_cidrs"></a> [vcn\_cidrs](#input\_vcn\_cidrs) | The list of IPv4 CIDR blocks the VCN will use. | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_vcn_dns_label"></a> [vcn\_dns\_label](#input\_vcn\_dns\_label) | A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet. | `string` | `"oke"` | no |
| <a name="input_vcn_name"></a> [vcn\_name](#input\_vcn\_name) | name of vcn | `string` | `"oke-vcn"` | no |
| <a name="input_worker_type"></a> [worker\_type](#input\_worker\_type) | Whether to provision public or private workers. | `string` | `"private"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID of the Kubernetes cluster |
| <a name="output_nodepool_ids"></a> [nodepool\_ids](#output\_nodepool\_ids) | Map of Nodepool names and IDs |

<!--- END_TF_DOCS --->