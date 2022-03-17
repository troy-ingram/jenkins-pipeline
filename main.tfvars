vpc_cidr        = "10.1.0.0/16"
public_cidr     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
key_name        = "wp_key"
public_key_path = "/home/ubuntu/.ssh/wpkey.pub"
instance_count  = 1