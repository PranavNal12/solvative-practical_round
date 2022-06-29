variable "aws_region" {
    description = "AWS Region"
    type = string
}

variable "vpc_cidr" {
    description = "VPC CIDR block / define IP of VPC"
    default = "10.0.0.0/8"
    type = string
}

variable "environment" {
    description = "Environment name"
    type = string
}

variable "public_subnets_cidr" {
    description = "Public subnet CIDR block"
    default = "10.5.0.0/16"
    type = string
}

variable "private_subnets_cidr" {
    description = "private subnet CIDR block"
    default = "10.10.0.0/16"
    type = string
}

variable "availability_zone" {
    description = "Define Availiblity-Zone"
    type = string
}


