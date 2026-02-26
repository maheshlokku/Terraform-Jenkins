# Get Latest Amazon Linux 2 AMI
data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "main" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id

  tags = {
    Name = "terraform-ec2"
  }
}
  
