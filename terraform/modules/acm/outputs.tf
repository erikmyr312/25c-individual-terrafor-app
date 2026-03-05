output "certificate_arn" {
  value = aws_acm_certificate.this.arn
}

output "domain_validation_options" {
  description = "DNS records must create in Route53 (or DNS provider) to validate the cert."
  value       = aws_acm_certificate.this.domain_validation_options
}