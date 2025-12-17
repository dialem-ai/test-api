locals {
  aws_region = "us-east-1"
  vpc_id     = "vpc-0e052765b44d6d104"

  ecr_repo_name    = "dashboard/api"
  ecs_cluster_name = "api-cluster"
  ecs_service_name = "dialem-api-task-def-service-2frxiyw3"

  # ECS Network Configuration
  ecs_subnet_ids = [
    "subnet-0bc43fc60bfcb65ec", # us-east-1b
    "subnet-054f5f07fca700057", # us-east-1e
    "subnet-0d1e389a1866e7e2c", # us-east-1d
    "subnet-097a2aafd5ae1aa7d", # us-east-1a
    "subnet-0dabca04eba5c14d7", # us-east-1f
    "subnet-08d9205cd0691c2ce", # us-east-1c
  ]
  ecs_sg_ids = ["sg-01c68b06afa653e42"]

  # RDS Configuration
  rds_identifier         = "api-db"
  rds_subnet_group_name  = "default-vpc-0e052765b44d6d104"
  rds_security_group_ids = ["sg-0aabd471db96ee23b"]

  # Load Balancer Configuration
  target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:300869608277:targetgroup/tg-dialem-api-3000/6d2d1c8f83b86e16"
}
