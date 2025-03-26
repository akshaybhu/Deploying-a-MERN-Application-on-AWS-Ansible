# variables.tf
variable "vpc_id" {
  description = "Existing VPC ID"
  default     = "vpc-03c56cda94b8d7229"
}

variable "ssh_key_name" {
  description = "SSH key pair name"
  default     = "EC2-AMI-Aks-HV"
}

variable "my_ip" {
  description = "Your IP address for SSH access"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  default     = "172.31.32.0/20"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  default     = "172.31.0.0/20"
}

variable "web_instance_type" {
  description = "Instance type for web server"
  default     = "t2.micro"
}

variable "db_instance_type" {
  description = "Instance type for database server"
  default     = "t2.micro"
}
