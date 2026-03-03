variable "name" {
  type        = string
  description = "Name prefix"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID for bastion"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "Your public IP in CIDR format (x.x.x.x/32)"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name"
}

variable "db_security_group_id" {
  type        = string
  description = "RDS security group ID"
}

variable "db_port" {
  type        = number
  description = "DB port (5432 for Postgres, 3306 for MySQL)"
}