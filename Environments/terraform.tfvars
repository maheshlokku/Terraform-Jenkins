vpcs = {
  vpc1 = {
    cidr_block = "10.0.0.0/16"
    name       = "vpc-1"
  }
  vpc2 = {
    cidr_block = "20.0.0.0/16"
    name       = "vpc-2"
  }
  vpc3 = {
    cidr_block = "30.0.0.0/16"
    name       = "vpc-3"
  }
}

subnets = {
  subnet1 = {
    vpc_key    = "vpc1"
    cidr_block = "10.0.1.0/24"
    az         = "ap-south-1a"
    name       = "subnet-1"
  }
  subnet2 = {
    vpc_key    = "vpc2"
    cidr_block = "20.0.1.0/24"
    az         = "ap-south-1b"
    name       = "subnet-2"
  }
  subnet3 = {
    vpc_key    = "vpc3"
    cidr_block = "30.0.1.0/24"
    az         = "ap-south-1c"
    name       = "subnet-3"
  }
}

ec2_instances = {
  ec21 = {
    subnet_key    = "subnet1"
    instance_type = "t2.micro"
    name          = "ec2-1"
  }
  ec22 = {
    subnet_key    = "subnet2"
    instance_type = "t2.micro"
    name          = "ec2-2"
  }
  ec23 = {
    subnet_key    = "subnet3"
    instance_type = "t2.micro"
    name          = "ec2-3"
  }
}