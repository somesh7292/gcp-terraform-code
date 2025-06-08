<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 6.38.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.7.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_function"></a> [cloud\_function](#module\_cloud\_function) | git::https://github.com/somesh7292/gcp-terraform-module.git//project-cloud-function | project-cloud-function/1.0.0 |
| <a name="module_project"></a> [project](#module\_project) | git::https://github.com/somesh7292/gcp-terraform-module.git//project | project/1.0.0 |
| <a name="module_secret_manager"></a> [secret\_manager](#module\_secret\_manager) | git::https://github.com/somesh7292/gcp-terraform-module.git//project-secret-manager | project-secret-manager/1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Id of associated billing account | `string` | n/a | yes |
| <a name="input_project_initial_name"></a> [project\_initial\_name](#input\_project\_initial\_name) | Initial project name | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP region name | `string` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Suffix for the project name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->