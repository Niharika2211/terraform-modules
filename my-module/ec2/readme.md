# Terraform AWS EC2 Module

## Overview
This Terraform module provisions an AWS EC2 instance with configurable settings, including AMI, instance type, key pair, subnet, and security groups. It is designed to be reusable and adaptable for different environments.

## Features
- Creates an EC2 instance with a specified AMI and instance type
- Supports key pair association for SSH access
- Attaches the instance to a specified subnet and security groups
- Uses tagging for better resource identification

## Prerequisites
Before using this module, ensure that you have:
- Terraform installed (v1.0+ recommended)
- AWS CLI configured with appropriate permissions
- A VPC with subnets and security groups
- A valid AWS key pair for SSH access

## Usage
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

## Inputs
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

## Outputs
| Output       | Description |
|-------------|-------------|
| public_ip   | Public IP of the EC2 instance |
| private_ip  | Private IP of the EC2 instance |

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

