<!-- BEGIN_TF_DOCS -->
## Requirements

1. Terraform version 1.12 or greater
2. Google Cloud SDK
3. A GCP project to store bucket for state files
4. Billing enabled for linking new project with a billing id

## Required Permissions
The executing identity (user or service account) must have:

1. roles/resourcemanager.projectIamAdmin
2. roles/iam.serviceAccountAdmin
3. roles/secretmanager.admin
4. roles/storage.admin
5. roles/cloudfunctions.admin

##SETUP & RUN
1. Authenticate with GCP
   ```
   gcloud auth login
   gcloud auth application-default login
   ```
2. Clone the repo
   ```
   git clone https://github.com/somesh7292/gcp-terraform-code.git
   cd gcp-terraform-code/project/adt
   ```
3. Create a .tfvars file with content
   ```
   suffix          = "<env name>
   region          = "<default region>"
   billing_account = "<billing account id>"
   ```

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
