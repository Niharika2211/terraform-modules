variable "environment" {
  type        = string
  description = "Deployment environment (e.g., dev, prod)."
}

variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "lb_type" {
  type        = string
  description = "Load balancer type (application or network)."
}

variable "internal_external" {
  type        = bool
  description = "True for internal, false for external load balancer."
}

variable "alb_security_group" {
  type        = list(string)
  description = "List of security group IDs for the ALB."
}

variable "alb_subnets" {
  type        = list(string)
  description = "List of subnet IDs for the ALB."
}

variable "enable_deletion_protection" {
  type        = bool
  description = "Enable or disable deletion protection."
}

variable "create_http_listener" {
  type        = bool
  default     = true
  description = "Enable HTTP listener."
}

variable "create_https_listener" {
  type        = bool
  default     = true
  description = "Enable HTTPS listener."
}

variable "certificate_arn" {
  type        = string
  default     = ""
  description = "ARN of the SSL certificate for HTTPS."
}

variable "zone_id" {
  type        = string
  description = "Route 53 hosted zone ID."
}

variable "common_tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to all resources."
}

variable "component" {
  type        = string
  description = "Component name (e.g., frontend, backend)."
}
