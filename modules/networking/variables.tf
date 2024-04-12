variable "namespace" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.40.0.0/16"
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.40.11.0/24", "10.40.12.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.40.101.0/24", "10.40.102.0/24"]
}

variable "SG_cidr_Public" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "SG_Ports" {
  type    = list(number)
  default = [22, 80, 443, 4532]
}