module "vpc" {
  source   = "../modules/vpc"
  for_each = var.vpcs

  cidr_block = each.value.cidr_block
  name       = each.value.name
}

module "subnet" {
  source   = "../modules/subnet"
  for_each = var.subnets

  vpc_id     = module.vpc[each.value.vpc_key].vpc_id
  cidr_block = each.value.cidr_block
  az         = each.value.az
  name       = each.value.name
}

module "ec2" {
  source   = "../modules/ec2"
  for_each = var.ec2_instances

  subnet_id     = module.subnet[each.value.subnet_key].subnet_id
  instance_type = each.value.instance_type
  name          = each.value.name
}