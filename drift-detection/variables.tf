variable "current_ami_id" {
  description = "AMI currently running on the EC2 instance"
  type        = string
}

variable "approved_ami_id" {
  description = "Latest approved AMI from the platform image registry"
  type        = string
}