# 🔐 Terraform AWS ACM Certificate Module

## 📜 Overview
This Terraform module provisions an **AWS ACM Certificate** for a domain and automatically validates it using DNS-based validation through **Route 53**. The module also supports dynamic configuration of certificate tags and integration with AWS services.

## 🔧 Features
- 🛡️ **Create an ACM certificate** for a domain with DNS validation
- 🌐 **DNS-based validation** using Route 53
- 🏷️ **Dynamic tagging** for better resource management
- 🔄 **Supports multiple environments** through flexible variable configuration

## 📋 Prerequisites
Before using this module, ensure that you have:
- ⚙️ **Terraform** installed (v1.0+ recommended)
- 🛠️ **AWS CLI** configured with appropriate permissions
- 🌐 A **Route 53** hosted zone created for DNS management

## 💻 Usage
```hcl
module "acm_certificate" {
  source            = "./modules/acm_certificate"
  environment       = "dev"
  project_name      = "myproject"
  component         = "web-app"
  zone_name         = "example.com"
  zone_id           = "Z3ABCDEFG123"
  
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
| 🔌 **component**     | string        | Name of the specific component (e.g., web-app). |
| 🌐 **zone_name**     | string        | The DNS zone name (e.g., example.com). |
| 🏷️ **common_tags**   | map(any)      | Tags applied to all resources. |
| 🧭 **zone_id**       | string        | ID of the Route 53 hosted zone. |

## 📦 Outputs
| Output        | Description |
|---------------|-------------|
| 🛡️ **certificate_arn** | ARN of the created ACM certificate |

## 🔄 Resources Created
- **AWS ACM Certificate** for the specified domain with DNS validation.
- **AWS Route 53 DNS Records** for certificate validation.
- **ACM Certificate Validation** to finalize the certificate validation process.

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
