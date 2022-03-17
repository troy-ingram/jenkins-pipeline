variable "vpc_cidr" {
  type = string
}

variable "public_cidr" {
  type = list(string)
  default = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
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

variable "instance_count" {
  type    = number
  default = 1
}
