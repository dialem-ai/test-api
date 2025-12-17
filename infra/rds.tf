# RDS Database Instance - Exact match to AWS configuration
resource "aws_db_instance" "api" {
  identifier = local.rds_identifier

  # Engine Configuration
  engine         = "postgres"
  engine_version = "17.6"
  instance_class = "db.t4g.micro"

  # Storage Configuration
  allocated_storage     = 20
  max_allocated_storage = 100 # Autoscaling enabled
  storage_type          = "gp2"
  storage_encrypted     = true
  kms_key_id            = "arn:aws:kms:us-east-1:300869608277:key/38baf150-16d1-409d-93bc-dfc04fd222aa"

  # Database Configuration
  username = "api_admin"
  password = var.db_password
  port     = 5432

  # Network Configuration
  db_subnet_group_name   = local.rds_subnet_group_name
  vpc_security_group_ids = local.rds_security_group_ids
  publicly_accessible    = true
  multi_az               = false
  availability_zone      = "us-east-1d"
  network_type           = "IPV4"

  # Parameter and Option Groups
  parameter_group_name = "default.postgres17"
  option_group_name    = "default:postgres-17"

  # Backup Configuration
  backup_retention_period = 1
  backup_window           = "09:38-10:08"
  copy_tags_to_snapshot   = true
  skip_final_snapshot     = true  # Matches current AWS configuration

  # Maintenance
  auto_minor_version_upgrade  = true
  maintenance_window          = "thu:03:58-thu:04:28"
  ca_cert_identifier          = "rds-ca-rsa2048-g1"
  deletion_protection         = false

  # Performance Insights
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = "arn:aws:kms:us-east-1:300869608277:key/38baf150-16d1-409d-93bc-dfc04fd222aa"
  performance_insights_retention_period = 7

  # Monitoring
  monitoring_interval             = 0
  iam_database_authentication_enabled = false

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      password,
      final_snapshot_identifier,
    ]
  }
}
