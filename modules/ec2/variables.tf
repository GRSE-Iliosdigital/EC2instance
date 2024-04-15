variable "namespace" {
  type = string
}

variable "vpc" {
  type = any
}

variable "ami" {
  default = "ami-09c443d9277298026"
}

variable key_name {
  type = string
}

variable "sg_pub_id" {
  type = any
}

variable "sg_priv_id" {
  type = any
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t4g.2xlarge"
}

variable "username" {
  description = "The username to use for SSH authentication on the EC2 instance"
  default     = "ubuntu"
}

variable "root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 500  
}

variable "root_volume_type" {
  description = "Type of the root volume"
  type        = string
  default     = "gp3"  
}