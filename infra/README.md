# Infrastructure (Terraform)

The `/infra` folder contains one file per resource (ECR, ECS, RDS, etc).
Instance names and IDs are held in `settings.tf` for easy changes.

## How It Works

Let's look at `rds.tf` as an example:

1. First, you specify the resource type and name: `resource "aws_db_instance" "api"`
2. Then, you configure it with settings like `allocated_storage` or `availability_zone`
3. These configurations map directly to what you see in the AWS console

That's the general gist of Terraform. It connects to an S3 bucket that holds the state, we define the configuration for each resource, then we apply changes which updates the infrastructure.

## Commands

```bash
terraform init    # Initialize (download providers)
terraform plan    # View the changes before applying
terraform apply   # Push changes to AWS
```
