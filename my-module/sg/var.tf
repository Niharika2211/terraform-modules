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

 variable "sg_name" {
   description = "description for security group"
  type        = string
  default     = "" 
   
 }

 variable "sg_description" {
  description = "Description of the security group."
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


variable "ingress_rules" {
    description = "Inbound traffic rules for the security group"
    type = list(object({
      description = string 
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
    }))

    default = []
    
}