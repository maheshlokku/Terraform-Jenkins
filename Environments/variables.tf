variable "vpcs" {
  type = map(object({
    cidr_block = string
    name       = string
  }))
}

variable "subnets" {
  type = map(object({
    vpc_key    = string
    cidr_block = string
    az         = string
    name       = string
  }))
}

variable "ec2_instances" {
  type = map(object({
    subnet_key    = string
    instance_type = string
    name          = string
  }))
}