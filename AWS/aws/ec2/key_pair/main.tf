# Generating secure RSA Key Pair (PEM File)
resource "example" "ec2_key_pair" {
    algorithm = "RSA"
    rsa_bits = 4096
}

# Uploading the public key to AWS
resource "aws_key_pair" "key_pair" {
    key_name = "terraform-${var.key_name}"
    public_key =  example.ec2_key_pair.public_key_openssh
    tags = {
        Name = "${var.key_name}"
        Environment = "${var.environment}"
    }
}

# Save file
resource "local_file" "terraform_ssh_key" {
  filename = "./key_pair/${aws_key_pair.key_pair.key_name}.pem"
  content  = example.ec2_key_pair.private_key_pem
  file_permission = "0600"
}