# Terraform AWS Load Balancer Module

## Overview
This Terraform module provisions an AWS Application Load Balancer (ALB) along with HTTP and HTTPS listeners and a Route 53 DNS record. It is designed to be reusable and configurable for different environments.

## Features
- Creates an AWS ALB
- Configurable HTTP and HTTPS listeners
- Supports internal and external load balancers
- Allows enabling/deactivating deletion protection
- Adds a Route 53 DNS record
- Supports tagging for better resource management

## Prerequisites
Before using this module, ensure that you have:
- Terraform installed (v1.0+ recommended)
- AWS CLI configured with appropriate permissions
- A VPC with subnets and security groups
- A Route 53 hosted zone

## Usage
```hcl
module "alb" {
  source                     = "./modules/alb"
  environment                = "dev"
  project_name               = "myproject"
  component                  = "frontend"
  lb_type                    = "application"
  internal_external          = false
  alb_security_group         = ["sg-0123456789abcdef0"]
  alb_subnets                = ["subnet-0123456789abcdef0", "subnet-0987654321fedcba"]
  enable_deletion_protection = true
  create_http_listener       = true
  create_https_listener      = true
  certificate_arn            = "arn:aws:acm:region:account-id:certificate/cert-id"
  zone_id                    = "Z1234567890ABC"
  common_tags = {
    Owner      = "DevOps Team"
    ManagedBy  = "Terraform"
  }
}
```

## Inputs
| Variable                  | Type          | Default | Description |
|---------------------------|--------------|---------|-------------|
| environment               | string       |         | Deployment environment (e.g., dev, prod). |
| project_name              | string       |         | Name of the project. |
| component                 | string       |         | Component name (e.g., frontend, backend). |
| lb_type                   | string       |         | Load balancer type (application or network). |
| internal_external         | bool         |         | `true` for internal, `false` for external load balancer. |
| alb_security_group        | list(string) |         | List of security group IDs for the ALB. |
| alb_subnets               | list(string) |         | List of subnet IDs for the ALB. |
| enable_deletion_protection | bool         | false   | Enable or disable deletion protection. |
| create_http_listener      | bool         | true    | Enable HTTP listener. |
| create_https_listener     | bool         | true    | Enable HTTPS listener. |
| certificate_arn           | string       | ""      | ARN of the SSL certificate for HTTPS. |
| zone_id                   | string       |         | Route 53 hosted zone ID. |
| common_tags               | map(string)  | {}      | Tags applied to all resources. |

## Outputs
| Output        | Description |
|--------------|-------------|
| arn          | ARN of the ALB |
| http_listener | ARN of the HTTP listener |
| https_listener | ARN of the HTTPS listener |

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

