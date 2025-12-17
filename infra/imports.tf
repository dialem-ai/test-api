import {
  to = aws_ecs_cluster.api
  id = "api-cluster"
}

import {
  to = aws_ecs_cluster_capacity_providers.api
  id = "api-cluster"
}

import {
  to = aws_ecs_service.api
  id = "api-cluster/dialem-api-task-def-service-2frxiyw3"
}

import {
  to = aws_ecr_repository.api
  id = "dashboard/api"
}

import {
  to = aws_db_instance.api
  id = "api-db"
}
