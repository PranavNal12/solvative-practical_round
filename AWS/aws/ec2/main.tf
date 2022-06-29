provider "aws" {
    region = var.aws_region
    profile = var.aws_profile
}

module "key_pair" {
    source = "./key_pair"
    environment = var.environment
    key_name = var.key_name
}

module "security_group" {
    source = "./security_group"  
    vpc_id = var.vpc_id
    vpn_sg = var.vpn_sg
    sg_name = var.sg_name
    whitelist = var.whitelist
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.instance_name

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "terraform-${var.key_name}"
  monitoring             = var.enable_monitoring
  vpc_security_group_ids = ["${module.security_group.aws_sg_id}"]
  subnet_id              = var.subnet_id
  root_block_device = [ {
    "device_name" = "rootfs-${var.instance_name}"
    "volume_size" = "${var.rootfs_size}"
  } ]

  tags = {
    Terraform   = var.enable_terraform
    Environment = var.environment
    Name = "${var.instance_name}-instance"
  }
}

resource "aws_kms_key" "volume_encryption" {
    description = "To encrypt and decrypt the EBS Volumes"
    tags = {
      "Name" = "${var.instance_name}-kms-key"
      "Alias"= "${var.instance_name}-kms-key"
    }
}

resource "aws_ebs_volume" "datafs" {
    availability_zone = var.availability_zone
    size = var.datafs_size
    type = var.ebs_volume_type
    encrypted = var.enable_volume_encryption
    kms_key_id = aws_kms_key.volume_encryption.arn

    tags = {
      "Name" = "${var.instance_name}-data-volume"
    }
}

resource "aws_volume_attachment" "datafs_attach" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.datafs.id
    instance_id = module.ec2_instance.id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.eip_manager.id
}


