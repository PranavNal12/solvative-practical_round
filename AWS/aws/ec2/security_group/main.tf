resource "aws_security_group" "security_group" {
    name = var.sg_name  
    description = "example environment seciurity group"
    vpc_id = var.vpc_id

    # Igress Rules for security groups
    ingress {
      description = "Allow all traffic through VPN server"
      from_port = "0"
      protocol = "-1"
      security_groups = [ "${var.vpn_sg}" ]
      cidr_blocks = var.whitelist
      self = true
      to_port = "0"
    }
    ingress {
      description = "Allow SSH traffic"
      from_port = "22"
      protocol = "tcp"
      # security_groups = [ "0.0.0.0" ]
      cidr_blocks = [ "0.0.0.0/0" ]
      self = true
      to_port = "22"
    }    
    egress {
       description = "Allow SSH traffic"
      from_port = "0"
      protocol = "-1"
      # security_groups = [ "0.0.0.0" ]
      cidr_blocks = [ "0.0.0.0/0" ]
      self = true
      to_port = "0"
    }
    tags = {
        Name = var.sg_name
    }
}

