# 🚀 Terraform Auto Scaling Deployment

## 📌 Overview
This Terraform configuration sets up an **Auto Scaling Group (ASG)** with an **Application Load Balancer (ALB)** in AWS. The setup includes a launch template, target group, listener rule, and autoscaling policies to ensure seamless scaling and availability.

---

## 📂 File Structure

```
📦 Terraform Auto Scaling
├── 📄 main.tf         # 📜 Defines resources like ASG, ALB, Launch Template
├── 📄 variables.tf    # 📌 Defines input variables
├── 📄 outputs.tf      # 📤 Outputs generated values
├── 📄 README.md       # 📖 Documentation
```

---

## ⚙️ Resources Created

### 1️⃣ **Launch Template (`aws_launch_template`)** 🏗️
- 🖼️ Specifies instance settings like AMI, instance type, and security groups.
- 🏷️ Includes tagging specifications.

### 2️⃣ **Target Group (`aws_lb_target_group`)** 🎯
- 🔄 Routes traffic to the auto-scaled instances.
- ❤️ Configured with a health check for monitoring.

### 3️⃣ **Auto Scaling Group (`aws_autoscaling_group`)** 📈
- 🚀 Manages EC2 instances based on demand.
- 📌 Uses the launch template and target group.
- 🔄 Supports rolling updates.

### 4️⃣ **Auto Scaling Policy (`aws_autoscaling_policy`)** 🎚️
- 📊 Implements target tracking scaling based on **CPU Utilization**.

### 5️⃣ **Listener Rule (`aws_lb_listener_rule`)** 🔊
- 📡 Forwards traffic to the target group based on the domain name.

---

## 📌 Variables (`variables.tf`)
| 🔢 **Variable Name**          | 📝 **Description**                         |
|-----------------------------|--------------------------------------|
| 🌍 `envirnoment`              | Environment name (e.g., dev, prod)  |
| 📂 `project_name`             | Name of the project                 |
| 🏗️ `component`                | Component name                      |
| 🖼️ `ami_id`                   | AMI ID for instances                |
| 💻 `instance_type`            | EC2 instance type                    |
| 🔑 `key_name`                 | SSH Key Pair Name                   |
| 🔐 `vpc_security_group_ids`   | Security group IDs                   |
| 🚪 `port`                     | Port for the target group            |
| 🔍 `health_check_path`        | Path for ALB health check            |
| 🌐 `vpc_id`                   | VPC ID                               |
| 🔝 `asg_max_size`             | Maximum ASG instances                |
| 🔽 `asg_min_size`             | Minimum ASG instances                |
| ⏳ `health_check_grace_period`| Time for ASG health check            |
| 📊 `desired_capacity`         | Desired ASG capacity                 |
| 🗺️ `subnets`                  | List of VPC subnets                  |
| 🎯 `target_value`             | Target CPU utilization percentage    |
| 🔗 `listener_arn`             | ARN of the ALB listener              |
| 🌎 `zone_name`                | Domain zone name                     |

---

## 📤 Outputs (`outputs.tf`)
| 🔢 **Output Name** | 📝 **Description** |
|------------|-------------|
| 🏷️ `lt_arn`   | ARN of the created launch template |

---

## 🔧 How to Use 🚀

### 1️⃣ **Initialize Terraform** 🏗️
```sh
terraform init
```

### 2️⃣ **Plan Deployment** 📋
```sh
terraform plan
```

### 3️⃣ **Apply Changes** ⚙️
```sh
terraform apply -auto-approve
```

### 4️⃣ **Destroy Resources (If Needed)** 🗑️
```sh
terraform destroy -auto-approve
```

---

## 📌 Notes 📝
- 🔐 Ensure AWS credentials are configured before running Terraform.
- 🛠️ Replace variable values in a `.tfvars` file or provide them via CLI.
- 🔄 Modify `priority` in the listener rule if using multiple rules.


## Author
Developed by Niharika for AWS DevOps automation.

📧 **For questions or issues, feel free to reach out!** 🚀
