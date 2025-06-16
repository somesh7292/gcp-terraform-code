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

## Project Structure
```
├── gcp-terraform-code
│   ├── project
│   │   └── <project-name>
│   │       ├── dev.tfvars
│   │       ├── main.tf
│   │       ├── output.tf
│   │       ├── README.md
│   │       ├── stage.tfvars
│   │       ├── variable.tf
│   │       └── versions.tf
│   ├── README.md
│   └── workload
│       └── <project-name>
│           └── <app-code>
│               ├── dev.tfvars
│               ├── function.tf
│               ├── loadbalancer.tf
│               ├── monitoring.tf
│               ├── output.tf
│               ├── README.md
│               ├── src
│               │   ├── functions.zip
│               │   ├── main.py
│               │   └── requirements.txt
│               ├── stage.tfvars
│               ├── variable.tf
│               └── versions.tf
└── gcp-terraform-module
    ├── cloudfunction
    │   ├── function.tf
    │   ├── output.tf
    │   ├── README.md
    │   ├── variable.tf
    │   └── versions.tf
    ├── project
    │   ├── output.tf
    │   ├── project.tf
    │   ├── README.md
    │   ├── service_account.tf
    │   ├── variable.tf
    │   └── versions.tf
    ├── project-cloud-function
    │   ├── api.tf
    │   ├── output.tf
    │   ├── README.md
    │   ├── service_account.tf
    │   ├── variable.tf
    │   └── versions.tf
    ├── project-secret-manager
    │   ├── api.tf
    │   ├── README.md
    │   └── variable.tf
    └── secret-manager
        ├── output.tf
        ├── README.md
        ├── secret-manager.tf
        ├── variable.tf
        └── versions.tf
```
<project-name> : Folder created as per project name
<app-code>: Unique code of each application

## Naming convention used to created project id

project_initial_name = "${var.project_initial_name}-${var.suffix}-${random_id.project_suffix.hex}"

var.project_initial_name: Initial name of the project
var.suffix : Environment name of the project

A random id is added at end of each project name so that it can be identified as unique


##SETUP & RUN
1. Authenticate with GCP
   ```
   gcloud auth application-default login -- project <project id>

   #note:
   <project id is the id of the project where bucket is created to store the state files>
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
   
   eg: terraform init -backend-config=bucket=tfstate-4613 -backend-config=prefix=project/adt -reconfigure

   #note
   <bucket name is the name of the bucket which has been already created to store the state files>
   <project name> is the name of the project that has to be created
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
   A new project will be created along with supported services. Eg of outputs is given below
   ```
   Outputs:
   cloud_function_sa = "cloud-function@adt-new-dev-3e3cc9.iam.gserviceaccount.com"
   project_id = "adt-new-dev-3e3cc9"
   project_number = "220067226683"
   terraform_account_email = "terraform@adt-new-dev-3e3cc9.iam.gserviceaccount.com"
   ```
   
10. To deploy cloud function change directory
    ```
    cd gcp-terraform-code/workload/adt/001-cloudfunction
    ```
11. Update the .tfvars file with content as per requirement
    ```
    project_id = <value of project_id generated in step 8>
    service_account_email = "Value of cloud_function_sa generated in step 8"

    Note:
    Values of other variables can be updated as per requirement
    ```
    
12. Update bucket and prefix in version.tf file
   ```
   terraform init -backend-config=bucket=<bucket name> -backend-config=prefix=workload/<project name>/<app code> -reconfigure

   eg: terraform init -backend-config=bucket=tfstate-4613 -backend-config=prefix=workload/adt/001-cloudfunction -reconfigure

   #note:
   <bucket name> is the name of the bucket which has been already created to store the state files,
   <project name> is the name of the project that has to be created,
   <app code> is code name of the application
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
   A cloudfunction along with load balancer, secret and monitoring alert will be created. Eg of output is given below
   
   ```
   Outputs:

   name = "function-v2"
   secret_id = "API_KEY"
   secret_version_id = "projects/220067226683/secrets/API_KEY/versions/1"
   google_compute_global_address = "34.149.71.226"
   
   ```
15. To test the api that has been created run the following commands
    ```
    gcloud auth login
    curl -X GET http://<google_compute_global_address>/helloworld -H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json"
   curl -X GET http://<google_compute_global_address>/apikey -H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json"
   curl -X GET http://<google_compute_global_address>/healthz -H "Authorization: bearer $(gcloud auth print-identity-token)" \
-H "Content-Type: application/json"

Note:
Value of <google_compute_global_address> is given as output in step 14

15. To destroy the resources
   ```
   terraform destroy -var-file=dev.tfvars #Change tfvars as per requirement
   ```
<!-- END_TF_DOCS -->
