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
