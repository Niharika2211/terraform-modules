# 🚀 Terraform Modules

[![Terraform](https://img.shields.io/badge/Terraform-v1.x-623CE4?style=for-the-badge&logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazon-aws)](https://aws.amazon.com/)
[![License](https://img.shields.io/github/license/yourusername/terraform-modules?style=for-the-badge)](LICENSE)

## 📌 Overview
Terraform is an Infrastructure as Code (IaC) tool that allows you to define, provision, and manage cloud resources efficiently using declarative configuration files. This repository contains reusable **Terraform modules** to simplify and standardize infrastructure provisioning. Each module is designed for efficiency, security, and scalability.

Using modules helps in breaking down infrastructure into manageable components, making it easy to reuse, maintain, and share configurations across multiple environments.

## ✅ Uses of This Terraform Modules Repository
- **Simplifies Infrastructure Management** – No need to write complex configurations from scratch. Just use the pre-built modules.
- **Ensures Consistency** – Standardized modules mean your infrastructure follows best practices every time.
- **Saves Time** – Quickly deploy and manage AWS resources without repeating code.
- **Easier Collaboration** – Teams can reuse modules, reducing errors and improving efficiency.
- **Scalability** – Easily modify and extend modules to fit growing infrastructure needs.

## ⚖️ Pros & Cons of Using This Repository

### **✔️ Pros:**
- **Reusable & Modular** – Use the same module across multiple projects.
- **Reduces Errors** – Pre-tested configurations minimize mistakes.
- **Faster Deployment** – Automates resource creation efficiently.
- **Customizable** – Modify parameters to fit specific requirements.
- **Version Control** – Easily track and update infrastructure changes.

### **❌ Cons:**
- **Learning Curve** – New users need to understand Terraform and module structure.
- **Limited to Pre-Built Features** – If a module lacks a feature, customization is needed.
- **Dependency Management** – Some modules depend on others, requiring careful usage.
- **Terraform Updates** – Future Terraform versions might require changes to module code.

## 📂 Module List
| Module Name      | Description                                      | Status |
|-----------------|--------------------------------------------------|--------|
| `vpc`          | Creates a Virtual Private Cloud (VPC)            | ✅ Stable |
| `ec2`          | Deploys an EC2 instance                          | 🚀 In Progress |
| `s3-bucket`    | Manages an S3 bucket with security policies      | ✅ Stable |
| `rds`          | Sets up an RDS database                          | 🔧 Under Review |

## 📜 How to Use
1. **Install Terraform** 🛠️ ([Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))
2. **Initialize Terraform**
   ```sh
   terraform init
   ```
3. **Apply the module**
   ```sh
   terraform apply -auto-approve
   ```

## 🏗️ Module Usage Example
```hcl
module "vpc" {
  source  = "https://github.com/Niharika2211/terraform-modules.git"
  region  = "us-east-1"
}
```

## 📖 Documentation
Each module has its own README with usage instructions, inputs, and outputs. Check the module directories for more details.

## 🤝 Contributing
We welcome contributions! Feel free to submit issues or pull requests.

## 📜 License
This project is licensed under the [MIT License](LICENSE).

---
🌟 **Star this repo if you find it useful!**

