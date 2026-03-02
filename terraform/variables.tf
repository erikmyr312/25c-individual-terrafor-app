variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "assume_role_arn" {
  description = "Role ARN Terraform assumes in target AWS account"
  type        = string
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}