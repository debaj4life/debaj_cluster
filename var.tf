variable "vpc_id" {
  type = string
  default = "vpc-071a935c677dbb90c"
  
}

variable "subnet_ranges" {
  type = list(string)
  default = ["subnet-0a66a5cfe19424c28", "subnet-0ac8b28d64573460b", "subnet-08b711d075f9a142a"]
}

variable "availability_zones" {
  description = "The availability zones for the subnets"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}


variable "region" {
  type        = string
  description = "aws region"
  default     = "eu-west-2"
}