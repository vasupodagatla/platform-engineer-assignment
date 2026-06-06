variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "ami_id" {
  description = "AMI ID used to launch the EC2 instance"
  type        = string
}

variable "environment" {
  description = "Deployment environment"

  type = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, or prod."
  }
}

variable "name" {
  description = "Name of the EC2 instance"
  type        = string
}