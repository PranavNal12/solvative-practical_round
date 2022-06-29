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

variable "whitelist" {
    description = "Lists of allowed source IPs"
    type = list
}