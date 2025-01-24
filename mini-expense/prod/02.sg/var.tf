variable "envirnoment" {
  description = "Environment type (e.g., dev, prod)"
  type        = string
  default     = ""
}

variable "project-name" {
  description = "Project name for identification"
  type        = string
  default     = ""
}


variable "vpc_id" {
  description = "ID of the VPC where resources will be created."
  type        = string
  default     = ""
}

variable "common_tags" {
  description = "Common tags to apply to resources"
  type        = map(any)
  default     = {}
}

