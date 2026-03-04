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

variable "allowed_ssh_cidr" {
  description = "Your public IP in CIDR format (x.x.x.x/32)"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "maintenance_bucket_name" {
  description = "Unique bucket name for the S3 maintenance website"
  type        = string
}

variable "allowed_http_cidr" {
  type        = string
  description = "CIDR allowed to access ALB HTTP"
}

variable "frontend_host" {
  type        = string
  description = "Host header for frontend"
}

variable "backend_host" {
  type        = string
  description = "Host header for backend"
}