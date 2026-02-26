module "vpc" {
  source    = "../modules/vpc"
  vpc_cidr  = var.vpc_cidr
}

module "subnet" {
  source      = "../modules/subnet"
  vpc_id      = module.vpc.vpc_id
  subnet_cidr = var.subnet_cidr
}

module "ec2" {
  source        = "../modules/ec2"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.subnet.subnet_id
  ami_id        = var.ami_id
  instance_type = var.instance_type
}