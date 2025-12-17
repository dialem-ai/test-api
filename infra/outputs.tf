# ECS Outputs
output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.api.name
}

output "ecs_cluster_arn" {
  description = "ARN of the ECS cluster"
  value       = aws_ecs_cluster.api.arn
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.api.name
}

# ECR Outputs
output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.api.repository_url
}

output "ecr_repository_name" {
  description = "Name of the ECR repository"
  value       = aws_ecr_repository.api.name
}

# RDS Outputs
output "rds_endpoint" {
  description = "RDS instance endpoint (includes port)"
  value       = aws_db_instance.api.endpoint
  sensitive   = false
}

output "rds_address" {
  description = "RDS instance address (without port)"
  value       = aws_db_instance.api.address
  sensitive   = false
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.api.port
  sensitive   = false
}

output "database_url" {
  description = "Database connection URL (set TF_VAR_db_password env var for real password)"
  value       = "postgresql://${aws_db_instance.api.username}:${var.db_password}@${aws_db_instance.api.address}:${aws_db_instance.api.port}/postgres"
  sensitive   = true
}

# VPC Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = local.vpc_id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = local.ecs_subnet_ids
}

output "ecs_security_group_id" {
  description = "ECS security group ID"
  value       = local.ecs_sg_ids[0]
}

output "rds_security_group_id" {
  description = "RDS security group ID"
  value       = local.rds_security_group_ids[0]
}

