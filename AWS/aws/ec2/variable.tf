variable "aws_region" {
    description = "AWS Region"
    type = string
}

variable "aws_profile" {
    description = "Select the AWS CLI profile for the Account"
    type = string
}

variable "key_name" {
    description = "Key pair name"
    type = string
}

variable "environment" {
    description = "Environment name"
    type = string
}

variable "sg_name" {
    description = "Name of the securioty group"
    type = string  
}

variable "vpc_id" {
    description = "VPC ID in which the resources are going to be deployed."
    type = string  
}

variable "vpn_sg" {
    description = "Security Group ID which is hosting the VPN server"
    type = string
}

variable "instance_type" {
    description = "The instance type for the instance"
    type = string
}

variable "ami_id" {
    description = "AMI id for the instance"
    type = string
}

variable "instance_name" {
    description = "Instance Name"
    type = string
}

variable "subnet_id" {
    description = "Subnet ID in which the resources are going to launch"
    type = string
}

variable "enable_monitoring" {
    description = "To enable instance monitoring"
    type = bool
}

variable "enable_terraform" {
    description = "Terraform provisioned resourse"
    type = bool
}

variable "datafs_size" {
    description = "Size of the data fs for storing the other files"
    type = number
    default = 50
}

variable "rootfs_size" {
    description = "Size of the root fs for storing OS files"
    type = number
    default = 30
}

variable "ebs_volume_type" {
    description = "Type of ebs storage volume example gp2, gp3 and standard"
    type = string
    default = "gp2"
}

variable "enable_volume_encryption" {
    description = "To enable or disable ebs volume encryption"
    default = "false"
    type = bool
}

# data "aws_instance" "availability_zone" {
#   name = var.instance_name
# }

variable "availability_zone" {
    description = "availaility zone of the instance"  
    type = string
}

variable "whitelist" {
    description = "Lists of allowed source IPs"
    type = list
}