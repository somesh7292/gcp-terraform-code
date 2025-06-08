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
3. Update the .tfvars file with content
   ```
   suffix          = "<env name>
   region          = "<default region>"
   billing_account = "<billing account id>"
   ```
4. Update bucket and prefix in version.tf file
   ```
   Bucket = <state file bucket name>
   Prefix = <Prefix to be used for state file>
   ```
5. Initialise terraform
   ```
   terraform init
   ```
6. Create or select workspace
   ```
   terraform workspace new dev # If running for first time, Dev is workspace name, rename it as per requirement
   terraform workspace list #If workspace already exists
   terraform workspace select dev #If workspace already exists
   ```
7. Terraform plan
   ```
   terraform plan -var-file=dev.tfvars #Change tfvars as per requirement
   ```
8. Terraform apply
   ```
   terraform apply -var-file=dev.tfvars #Change tfvars as per requirement
   ```
   A new project will be created along with supported services
9. To deploy cloud function change directory
    ```
    cd gcp-terraform-code/workload/abt/001-cloudfunction
    ```
10. Update the .tfvars file with content as per requirement
    
11. Update bucket and prefix in version.tf file
   ```
   Bucket = <state file bucket name>
   Prefix = <Prefix to be used for state file>
   ```
12. Create or select workspace
   ```
   terraform workspace new dev # If running for first time, Dev is workspace name, rename it as per requirement
   terraform workspace list #If workspace already exists
   terraform workspace select dev #If workspace already exists
   ```
13. Terraform plan
   ```
   terraform plan -var-file=dev.tfvars #Change tfvars as per requirement
   ```
14. Terraform apply
   ```
   terraform apply -var-file=dev.tfvars #Change tfvars as per requirement
   ```
   A cloudfunction along with load balancer, secret and monitoring alert will be created.
15. To destroy the resources
   ```
   terraform destroy -var-file=dev.tfvars #Change tfvars as per requirement
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
