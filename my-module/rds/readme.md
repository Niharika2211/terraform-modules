# Terraform AWS EC2 & RDS Modules

## Overview
This Terraform repository provisions AWS EC2 and RDS instances with configurable settings. It allows users to deploy virtual machines and managed databases efficiently while ensuring modularity and reusability.

## Features
### EC2 Module
- Creates an EC2 instance with a specified AMI and instance type
- Supports key pair association for SSH access
- Attaches the instance to a specified subnet and security groups
- Uses tagging for better resource identification

### RDS Module
- Provisions an RDS instance with a configurable database engine and version
- Supports subnet groups and security groups
- Allows enabling/disabling final snapshots on deletion
- Uses tagging for better resource identification

## Prerequisites
Before using this module, ensure that you have:
- Terraform installed (v1.0+ recommended)
- AWS CLI configured with appropriate permissions
- A VPC with subnets and security groups
- A valid AWS key pair for SSH access (for EC2)
- Subnet group created for RDS

## Usage
### EC2 Deployment
```hcl
module "ec2" {
  source                 = "./modules/ec2"
  envirnoment            = "dev"
  project_name           = "myproject"
  instance_name          = "web-server"
  ami                    = "ami-12345678"
  instance_type          = "t2.micro"
  key_name               = "my-key-pair"
  subnet_id              = "subnet-0123456789abcdef0"
  vpc_security_group_ids = ["sg-0123456789abcdef0"]
  common_tags = {
    Owner      = "DevOps Team"
    ManagedBy  = "Terraform"
  }
}
```

### RDS Deployment
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
### EC2 Inputs
| Variable                  | Type          | Description |
|---------------------------|--------------|-------------|
| envirnoment               | string       | Deployment environment (e.g., dev, prod). |
| project_name              | string       | Name of the project. |
| instance_name             | string       | Name of the instance. |
| ami                       | string       | Amazon Machine Image (AMI) ID. |
| instance_type             | string       | EC2 instance type (e.g., t2.micro). |
| key_name                  | string       | Key pair name for SSH access. |
| subnet_id                 | string       | Subnet ID where the instance will be deployed. |
| vpc_security_group_ids    | list(string) | List of security group IDs associated with the instance. |
| common_tags               | map(string)  | Tags applied to all resources. |

### RDS Inputs
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
### EC2 Outputs
| Output       | Description |
|-------------|-------------|
| public_ip   | Public IP of the EC2 instance |
| private_ip  | Private IP of the EC2 instance |

### RDS Outputs
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

