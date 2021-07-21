variable "region_name" {
  description = "Region name to deploy"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "Main CIDR"
  default     = "10.10.10.0/24"
}

variable "vpc_cidr_dmz" {
  description = "DMZ subnet"
  default = {
    subnet = "10.10.10.0/25"
    name   = "DMZ"
  }
}

variable "vpc_cidr_core" {
  description = "Core subnet"
  default = {
    subnet = "10.10.10.192/26"
    name   = "Core"
  }
}

variable "vpc_cidr_db" {
  description = "DB subnet"
  default = {
    subnet = "10.10.10.128/26"
    name   = "DB"
  }
}

variable "ingress_dmz" {
  default = [
    {
      description = "ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "http"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "https"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "vault"
      from_port   = 8200
      to_port     = 8200
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]
}
