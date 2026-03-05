This repository contains Terraform infrastructure code for the mini-project.


TLS Configuration for ALB

TLS support for the Application Load Balancer is implemented using AWS Certificate Manager (ACM) and Terraform modules.

Terraform Modules
An ACM module was added to create an SSL/TLS certificate. The ALB module was updated to optionally support an HTTPS listener on port 443.

Configuration
TLS behavior is controlled using Terraform variables in the environment configuration file.

Example (environments/dev/terraform.tfvars):

acm_domain_name = "app.example.com"
enable_https = false

When enable_https is set to true and a valid certificate ARN is provided, Terraform will create an HTTPS listener on the ALB.

Terraform Commands

terraform init
terraform fmt -recursive
terraform validate
terraform plan -var-file="environments/dev/terraform.tfvars"

Manual Steps

DNS validation is required for ACM certificates. After Terraform creates the certificate, AWS generates DNS validation records that must be added to the DNS provider (for example Route53).

In this project a placeholder domain was used, so the certificate was not fully validated.

Short Jira comment you can use:

Implemented TLS support for the ALB using AWS ACM via Terraform. Added an ACM module for certificate creation and updated the ALB module to support an optional HTTPS listener. Documentation was added to the README with configuration and validation details.