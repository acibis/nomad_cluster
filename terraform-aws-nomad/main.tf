
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name               = var.name
  cidr               = var.cidr

  azs                = var.azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  create_igw         = var.create_igw

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  
  tags = {
      owner       = var.owner
      environment = var.project
      terraform   = "true"
    }
}

resource "aws_key_pair" "nomad_key" {
  key_name   = var.key_name
  public_key = var.ssh_public_key
  }

module "nomad_cluster" {
  source = "./modules/nomad_cluster"

  allowed_inbound_cidrs  = flatten([ var.private_subnets, var.public_subnets])
  instance_type          = var.instance_type
  consul_version         = var.consul_version
  nomad_version          = var.nomad_version
  consul_cluster_version = var.consul_cluster_version
  bootstrap              = var.bootstrap
  key_name               = var.key_name
  name_prefix            = var.name_prefix
  vpc_id                 = module.vpc.vpc_id
  public_ip              = var.public_ip
  nomad_servers          = var.nomad_servers
  nomad_clients          = var.nomad_clients
  consul_config          = var.consul_config
  enable_connect         = var.enable_connect
  owner                  = var.owner
  my_ip                  = var.my_ip
  
}

resource "aws_db_subnet_group" "db_subnet_polymath" {
  name       = "polymath"
  subnet_ids = flatten([ module.vpc.public_subnets, module.vpc.private_subnets ])
}

