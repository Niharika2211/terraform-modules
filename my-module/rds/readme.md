# Terraform AWS RDS Module

## Overview
This Terraform module provisions an AWS RDS instance with configurable settings. It enables users to deploy a managed relational database efficiently while ensuring modularity and reusability.

## Features
- Provisions an RDS instance with a configurable database engine and version
- Supports subnet groups and security groups
- Allows enabling/disabling final snapshots on deletion
- Uses tagging for better resource identification

## Prerequisites
Before using this module, ensure that you have:
- Terraform installed (v1.0+ recommended)
- AWS CLI configured with appropriate permissions
- A VPC with subnets and security groups
- A subnet group created for RDS

## Usage
```hcl
module "rds" {
  source                 = "./modules/rds"
  envirnoment            = "dev"
  project-name           = "myproject"
  db_name                = "mydatabase"
  port                   = 3306
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "mypassword"
  db_subnet_group        = "my-subnet-group"
  vpc_security_group_ids = ["sg-0123456789abcdef0"]
  allocated_storage      = 20
  skip_final_snapshot    = true
  common_tags = {
    Owner      = "DevOps Team"
    ManagedBy  = "Terraform"
  }
}
```

## Inputs
| Variable                  | Type          | Description |
|---------------------------|--------------|-------------|
| envirnoment               | string       | Deployment environment (e.g., dev, prod). |
| project-name              | string       | Name of the project. |
| db_name                   | string       | Database name. |
| port                      | number       | Database port. |
| engine                    | string       | Database engine type (e.g., MySQL, PostgreSQL). |
| engine_version            | string       | Database engine version. |
| instance_class            | string       | RDS instance type (e.g., db.t3.micro). |
| username                  | string       | Database admin username. |
| password                  | string       | Database admin password. |
| db_subnet_group           | string       | Subnet group for the database. |
| vpc_security_group_ids    | list(string) | Security group IDs for the database. |
| allocated_storage         | number       | Storage size in GB. |
| skip_final_snapshot       | bool         | Skip final snapshot on DB deletion (true/false). |
| common_tags               | map(string)  | Tags applied to all resources. |

## Outputs
| Output          | Description |
|----------------|-------------|
| aws_db_instance | Endpoint address of the RDS instance |

## Deployment
1. Initialize Terraform:
   ```sh
   terraform init
   ```
2. Plan the deployment:
   ```sh
   terraform plan
   ```
3. Apply the configuration:
   ```sh
   terraform apply -auto-approve
   ```

## Cleanup
To destroy the resources, run:
```sh
terraform destroy -auto-approve
```

## License
This module is open-source and available under the MIT License.

## Author
Developed by Niharika for AWS DevOps automation.

