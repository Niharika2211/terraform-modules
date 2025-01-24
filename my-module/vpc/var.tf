variable "azs" {
  description = "Specifies the availability zones for resources"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_cidr_rng" {
  description = "Defines the CIDR range for the VPC"
  type        = string
  default     = "192.0.0.0/16"
}

variable "pub_sub_cidr" {
  description = "CIDR ranges for public subnets"
  type        = list(string)
  default     = ["192.0.1.0/24", "192.0.2.0/24"]
}

variable "pvt_sub_cidr" {
  description = "CIDR ranges for private subnets"
  type        = list(string)
  default     = ["192.0.3.0/24", "192.0.4.0/24"]
}

variable "db_sub_cidr" {
  description = "CIDR ranges for database subnets"
  type        = list(string)
  default     = ["192.0.5.0/24", "192.0.6.0/24"]
}

variable "enable_dns_hostnames" {
  description = "Enable or disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "envirnoment" {
  description = "Environment type (e.g., dev, prod)"
  type        = string
  default     = "prod"
}

variable "project-name" {
  description = "Project name for identification"
  type        = string
  default     = "mini"
}

variable "common_tags" {
  description = "Common tags to apply to resources"
  type        = map(any)
  default     = {
    "owner"        = "niha"
    "terraform"    = true
    "project_name" = "expense"
    "environment"  = "dev"
  }
}

variable "nat_enable" {
  description = "Enable or disable NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "ID of the VPC where resources will be created."
  type        = string
  default     = ""
}
