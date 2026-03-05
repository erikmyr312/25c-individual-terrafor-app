variable "domain_name" {
  description = "Primary domain name for the cert (e.g. app.example.com)"
  type        = string
}

variable "subject_alternative_names" {
  description = "Optional SANs"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}