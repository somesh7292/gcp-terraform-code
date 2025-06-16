<!-- BEGIN_TF_DOCS -->
## Requirements

1. Terraform version 1.12 or greater
2. Google Cloud SDK
3. A GCP project to store bucket for state files
4. We should have a bucket already created to store the state files, the user/SA should have sufficient permission to read and write objects in this bucket
5. Billing enabled for linking new project with a billing id

## Required Permissions
The executing identity (user or service account) must have:

1. roles/resourcemanager.projectCreator
2. roles/iam.serviceAccountAdmin
3. roles/secretmanager.admin
4. roles/storage.admin
5. roles/cloudfunctions.admin

##SETUP & RUN
1. Authenticate with GCP
   ```
   gcloud auth login
   gcloud auth application-default login -- project <project id>

   #note: <project id is the id of the project where bucket is created to store the state files>
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
   terraform init -backend-config=bucket=<bucket name> -backend-config=prefix=project/<project name> -reconfigure

   #note <bucket name is the name of the bucket which has been already created to store the state files> <project name> is the name of the project that has to be created
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
    ```
    project_id = <project id of project created by above commands>
    ```
    
12. Update bucket and prefix in version.tf file
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
<!-- END_TF_DOCS -->
