
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
  default = {
    "owner"        = "niha"
    "terraform"    = true
    "project_name" = "expense"
    "environment"  = "prod"
  }
}

variable "nat_enable" {
  description = "Enable or disable NAT Gateway for private subnets"
  type        = bool
  default     = false
}
