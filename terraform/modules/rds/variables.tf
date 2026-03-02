variable "name" {
  description = "Name prefix for RDS resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where RDS will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for DB subnet group"
  type        = list(string)
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "db_username" {
  description = "Master username"
  type        = string
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "engine" {
  description = "DB engine (postgres or mysql)"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "DB engine version"
  type        = string
  default     = "16.1"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage (GB)"
  type        = number
  default     = 20
}

variable "port" {
  description = "DB port"
  type        = number
  default     = 5432
}

variable "publicly_accessible" {
  description = "Keep false for private subnets"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Multi-AZ for higher availability (more cost)"
  type        = bool
  default     = false
}