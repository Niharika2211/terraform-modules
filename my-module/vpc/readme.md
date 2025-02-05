# Terraform AWS VPC Module

## Overview
This Terraform module provisions an AWS Virtual Private Cloud (VPC) with associated subnets, route tables, NAT gateway, and optional VPC peering.

## Features
- Creates a new VPC with configurable CIDR range
- Provisions public, private, and database subnets
- Configures an internet gateway and NAT gateway (optional)
- Supports VPC peering connection (optional)
- Associates subnets with appropriate route tables
- Enables DNS hostname resolution

## Prerequisites
Before using this module, ensure that you have:
- Terraform installed (v1.0+ recommended)
- AWS CLI configured with appropriate permissions

## Usage
```hcl
module "vpc" {
  source            = "./modules/vpc"
  envirnoment       = "dev"
  project-name      = "myproject"
  vpc_cidr_rng      = "10.0.0.0/16"
  azs               = ["us-east-1a", "us-east-1b"]
  pub_sub_cidr      = ["10.0.1.0/24", "10.0.2.0/24"]
  pvt_sub_cidr      = ["10.0.3.0/24", "10.0.4.0/24"]
  db_sub_cidr       = ["10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  nat_enable        = true

  common_tags = {
    Owner      = "DevOps Team"
    ManagedBy  = "Terraform"
  }
}
```

## Inputs
| Variable                  | Type         | Description |
|---------------------------|-------------|-------------|
| envirnoment               | string      | Deployment environment (e.g., dev, prod). |
| project-name              | string      | Name of the project. |
| vpc_cidr_rng              | string      | CIDR range for the VPC. |
| azs                       | list(string)| Availability zones for the subnets. |
| pub_sub_cidr              | list(string)| CIDR blocks for public subnets. |
| pvt_sub_cidr              | list(string)| CIDR blocks for private subnets. |
| db_sub_cidr               | list(string)| CIDR blocks for database subnets. |
| enable_dns_hostnames      | bool        | Enable DNS hostnames in the VPC. |
| nat_enable                | bool        | Enable NAT gateway for private subnets. |
| aws_vpc_peering_connection | bool       | Enable VPC peering connection. |
| common_tags               | map(any)    | Tags applied to all resources. |

## Outputs
| Output  | Description |
|---------|-------------|
| vpc_id  | ID of the created VPC. |
| vpc_arn | ARN of the created VPC. |
| pub-sub-id | IDs of the public subnets. |
| pvt-sub-id | IDs of the private subnets. |
| db-sub-id | IDs of the database subnets. |
| db_subnet_group_name | Name of the database subnet group. |

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

