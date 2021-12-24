### DB VARIABLES
variable project {
  default = "polymath"
}

variable "owner" {
  description = "value of owner tag on EC2 instances"
  default = "acibis"
}
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

variable "db_subnet_group_name" {
  type        = string
  default     = "polymath"
}

variable "vpc_security_group_ids" {
  type        = string
  default     =  "NOMAD_CLUSTER_SG_ID" # FILL THIS WITH THE SG OUTPUT FROM MAIN TF EXECUTION
}

