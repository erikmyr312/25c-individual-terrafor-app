variable "name" {
  type        = string
  description = "Name prefix"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for ALB"
}

variable "allowed_http_cidr" {
  type        = string
  description = "CIDR allowed to access ALB HTTP (my IP/32 for now)"
}

variable "frontend_host" {
  type        = string
  description = "Host header for frontend routing (example: app.local)"
}

variable "backend_host" {
  type        = string
  description = "Host header for backend routing (example: api.local)"
}

variable "frontend_port" {
  type    = number
  default = 80
}

variable "backend_port" {
  type    = number
  default = 8080
}

variable "frontend_health_path" {
  type    = string
  default = "/"
}

variable "backend_health_path" {
  type    = string
  default = "/"
}