
# 🛡️ Terraform AWS Security Group Module

## 📜 Overview
This Terraform module provisions an AWS Security Group with configurable ingress rules, egress rules, and tagging for improved resource management.

## 🔧 Features
- 🛠️ **Create a security group** with a specified name and description
- 🔥 **Dynamic ingress rules configuration** to manage inbound traffic
- 🚪 **Allows outbound (egress) access** to all destinations
- 🏷️ **Uses tagging** for better resource identification and management

## 📋 Prerequisites
Before using this module, ensure you have:
- ⚙️ **Terraform** installed (v1.0+ recommended)
- 🛠️ **AWS CLI** configured with appropriate permissions
- 🌐 A **VPC** where the security group will be created

## 💻 Usage
```hcl
module "security_group" {
  source          = "./modules/security_group"
  environment     = "dev"
  project_name    = "myproject"
  sg_name         = "my-security-group"
  sg_description  = "Allow necessary inbound traffic"
  vpc_id          = "vpc-12345678"
  
  ingress_rules = [
    {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  
  common_tags = {
    Owner      = "DevOps Team"
    ManagedBy  = "Terraform"
  }
}
```

## 📝 Inputs
| Variable            | Type          | Description |
|---------------------|---------------|-------------|
| 🌍 **environment**   | string        | Deployment environment (e.g., dev, prod). |
| 📂 **project_name**  | string        | Name of the project. |
| 🛡️ **sg_name**       | string        | Name of the security group. |
| 📝 **sg_description**| string        | Description of the security group. |
| 🌐 **vpc_id**        | string        | ID of the VPC where the security group is created. |
| 🚪 **ingress_rules** | list(object)  | List of ingress rules (port, protocol, CIDR blocks). |
| 🏷️ **common_tags**   | map(any)      | Tags applied to all resources. |

## 📦 Outputs
| Output   | Description |
|----------|-------------|
| 🛡️ **sg_id**  | ID of the created security group |

## 🚀 Deployment
1. **Initialize Terraform:**
   ```sh
   terraform init
   ```
2. **Plan the deployment:**
   ```sh
   terraform plan
   ```
3. **Apply the configuration:**
   ```sh
   terraform apply -auto-approve
   ```

## 🧹 Cleanup
To destroy the resources, run:
```sh
terraform destroy -auto-approve
```

## 📝 License
This module is open-source and available under the **MIT License**.

## 👩‍💻 Author
Developed by **Niharika** for AWS DevOps automation.

---

This format includes icons for various sections to make it visually appealing and easier to follow. If you have any specific icons you'd like to use or further adjustments, let me know!
