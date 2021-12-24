### GENERAL VARIABLES
variable project {
  default = "polymath"
}

variable "owner" {
  description = "value of owner tag on EC2 instances"
  default = "acibis"
}


### VPC MODULE VARIABLES
variable name {
  type        = string
  default     = "polymath_vpc"
}

variable cidr {
  type        = string
  default     = "10.0.0.0/16"
}

variable azs {
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  description = "availability zones"
}


variable private_subnets {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable public_subnets {
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}


variable enable_nat_gateway {
  type        = bool
  default     = true
}

variable enable_vpn_gateway {
  type        = bool
  default     = false
}
 
 variable create_igw {
  type        = bool
  default     = true
}

 variable enable_dns_hostnames {
  type        = bool
  default     = true
}
 
 
variable enable_dns_support {
  type        = bool
  default     = true
}


### NOMAD MODULE VARIABLES

variable "bootstrap" {
  type        = bool
  default     = true
  description = "Initial Bootstrap configurations"
}

variable "nomad_clients" {
  default     = "3"
  description = "number of Nomad instances"
}

variable "consul_config" {
  description = "HCL Object with additional configuration overrides supplied to the consul servers.  This is converted to JSON before rendering via the template."
  default     = {}
}

variable "consul_cluster_version" {
  default     = "0.0.1"
  description = "Custom Version Tag for Upgrade Migrations"
}

variable "nomad_servers" {
  default     = "3"
  description = "number of Nomad instances"
}

variable "consul_version" {
  description = "Consul version"
  default = "1.10.4"
}

variable "nomad_version" {
  description = "Nomad version"
  default = "1.2.3"
}

variable "enable_connect" {
  type        = bool
  description = "Whether Consul Connect should be enabled on the cluster"
  default     = false
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type for Nomad instances"
}

variable "key_name" {
  default     = "nomad_key"
  description = "SSH key name for Nomad instances"
}

variable "ssh_public_key" {
  default     = ""  # FILL THIS WITH .PUB GENERATED FROM KEY.PEM
  description = "SSH key name for Nomad instances"
}

variable "name_prefix" {
  description = "prefix used in resource names"
  default = "polymath"
}

variable "public_ip" {
  type        = bool
  default     = true
}

variable "my_ip" {
  type        = string
  default     = "YOUR_IP" # FILL THIS WITH YOUR IP ADDRESS
}


### DB VARIABLES
variable "db_name" {
  type        = string
  default     = "postgresql"
}

variable "username" {
  type        = string
  default     = "postgresql"
}

variable "password" {
  type        = string
  default     = "postgresql"
}
