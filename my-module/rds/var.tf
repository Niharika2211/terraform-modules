variable "envirnoment" {
    description = "Deployment envirnoment (e.g., dev, staging, prod)"
    type        = string
}

variable "project-name" {
    description = "Project name identifier"
    type        = string
}

variable "common_tags" {
    description = "Tags applied to all resources"
    type        = map(string)
}

variable "db_name" {
    description = "Database name"
    type        = string
}

variable "port" {
    description = "Database port"
    type        = number
}

variable "vpc_security_group_ids" {
    description = "Security group IDs for the database"
    type        = list(string)
}

variable "allocated_storage" {
    description = "Storage size in GB"
    type        = number
}


variable "engine" {
    description = "Database engine type (e.g., MySQL, PostgreSQL)"
    type        = string
}

variable "engine_version" {
    description = "Database engine version"
    type        = string
}

variable "instance_class" {
    description = "RDS instance type (e.g., db.t3.micro)"
    type        = string
}

variable "username" {
    description = "Database admin username"
    type        = string
}

variable "password" {
    description = "Database admin password"
    type        = string
}

variable "db_subnet_group" {
    description = "Subnet group for the database"
    type        = string
}

variable "skip_final_snapshot" {
    description = "Skip final snapshot on DB deletion (true/false)"
    type        = bool
}
