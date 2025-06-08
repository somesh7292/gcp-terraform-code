<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 6.38.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.38.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_google_cloudfunctions2_function"></a> [google\_cloudfunctions2\_function](#module\_google\_cloudfunctions2\_function) | git::https://github.com/somesh7292/gcp-terraform-module.git//cloudfunction | cloudfunction/1.0.0 |
| <a name="module_google_cloudfunctions2_function_backup"></a> [google\_cloudfunctions2\_function\_backup](#module\_google\_cloudfunctions2\_function\_backup) | git::https://github.com/somesh7292/gcp-terraform-module.git//cloudfunction | cloudfunction/1.0.0 |
| <a name="module_secret_manager"></a> [secret\_manager](#module\_secret\_manager) | ../../../../gcp-terraform-module/secret-manager | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_backend_service.fn_backend](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service) | resource |
| [google_compute_global_address.fn_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_global_forwarding_rule.fn_forwarding_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_region_network_endpoint_group.function_neg](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_endpoint_group) | resource |
| [google_compute_region_network_endpoint_group.function_neg_backup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_endpoint_group) | resource |
| [google_compute_target_http_proxy.fn_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy) | resource |
| [google_compute_url_map.fn_url_map](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| [google_monitoring_alert_policy.function_error_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |
| [google_monitoring_notification_channel.email](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Api key to be stored in secret manager | `string` | n/a | yes |
| <a name="input_available_memory"></a> [available\_memory](#input\_available\_memory) | Available memory for cloud function | `string` | n/a | yes |
| <a name="input_backend_service_name"></a> [backend\_service\_name](#input\_backend\_service\_name) | Backend service name | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the cloud function | `any` | n/a | yes |
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | Email address for alerts | `string` | n/a | yes |
| <a name="input_enable_cdn"></a> [enable\_cdn](#input\_enable\_cdn) | Flag to Enable cdn | `bool` | n/a | yes |
| <a name="input_entry_point"></a> [entry\_point](#input\_entry\_point) | Entry point of cloud function | `string` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Name of the function | `string` | n/a | yes |
| <a name="input_function_zip_path"></a> [function\_zip\_path](#input\_function\_zip\_path) | Path of zip file for cloud function | `string` | n/a | yes |
| <a name="input_ingress_settings"></a> [ingress\_settings](#input\_ingress\_settings) | Ingress setting for cloud function | `string` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | Name of the environment variable. | `string` | n/a | yes |
| <a name="input_load_balancing_scheme"></a> [load\_balancing\_scheme](#input\_load\_balancing\_scheme) | load balancing scheme | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | default location | `string` | n/a | yes |
| <a name="input_location_backup"></a> [location\_backup](#input\_location\_backup) | Backup location | `string` | n/a | yes |
| <a name="input_max_instance_count"></a> [max\_instance\_count](#input\_max\_instance\_count) | Maximum cloud function instance count | `number` | n/a | yes |
| <a name="input_network_endpoint_name"></a> [network\_endpoint\_name](#input\_network\_endpoint\_name) | Network endpoint name | `string` | n/a | yes |
| <a name="input_network_endpoint_type"></a> [network\_endpoint\_type](#input\_network\_endpoint\_type) | Network endpoint type | `string` | n/a | yes |
| <a name="input_port_name"></a> [port\_name](#input\_port\_name) | Port name to be used | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol for loadbalancer | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime of cloud function | `string` | n/a | yes |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | Name of the secret in secret manager | `string` | n/a | yes |
| <a name="input_timeout_sec"></a> [timeout\_sec](#input\_timeout\_sec) | Timeout for the load balancer | `string` | n/a | yes |
| <a name="input_timeout_seconds"></a> [timeout\_seconds](#input\_timeout\_seconds) | Timeout for cloud function | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_secret_id"></a> [secret\_id](#output\_secret\_id) | n/a |
| <a name="output_secret_version_id"></a> [secret\_version\_id](#output\_secret\_version\_id) | n/a |
<!-- END_TF_DOCS -->