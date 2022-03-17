variable "vpc_cidr" {
  type    = string
}

variable "public_cidr" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_key_path" {
  type = string
}

variable "access_ip" {
  type    = string
  default = "52.71.120.106/32"
}

variable "cloud9_ip" {
  type    = string
  default = "18.207.183.145/32"
}