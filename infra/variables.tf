# RDS Database Password
# Set via environment variable: export TF_VAR_db_password="your_password"
# Or leave empty - Terraform won't change the actual AWS password (it's in ignore_changes)
variable "db_password" {
  description = "Password for the RDS PostgreSQL database (set TF_VAR_db_password env var)"
  type        = string
  sensitive   = true
  default     = ""
}

