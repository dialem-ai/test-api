resource "aws_ecs_cluster" "api" {
  name = local.ecs_cluster_name

  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_ecs_cluster_capacity_providers" "api" {
  cluster_name = aws_ecs_cluster.api.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  # No default strategy configured (empty in AWS)
}

data "aws_ecs_service" "existing" {
  cluster_arn  = aws_ecs_cluster.api.arn
  service_name = local.ecs_service_name
}

resource "aws_ecs_service" "api" {
  name    = local.ecs_service_name
  cluster = aws_ecs_cluster.api.arn

  task_definition = data.aws_ecs_service.existing.task_definition
  desired_count   = data.aws_ecs_service.existing.desired_count
  launch_type     = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    subnets         = local.ecs_subnet_ids
    security_groups = local.ecs_sg_ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = local.target_group_arn
    container_name   = "api"
    container_port   = 3000
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
