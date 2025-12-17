# Data sources for existing Load Balancer resources
# These resources already exist and are being referenced

data "aws_lb_target_group" "api" {
  arn = local.target_group_arn
}

# Output the target group information
output "target_group_name" {
  description = "Target group name"
  value       = data.aws_lb_target_group.api.name
}

output "target_group_port" {
  description = "Target group port"
  value       = data.aws_lb_target_group.api.port
}

