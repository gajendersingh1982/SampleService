variable "myip" {
  description = "my IP"
  default = "182.77.7.242/32"
}

variable "publicIP" {
  description = "my IP"
  default = "182.77.7.242/32"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC, e.g: 10.0.0.0/16"
  default = "10.0.0.0/20"
}

variable "public_subnets" {
  description = "list of public subnets to be created"
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "list of private subnets to be created"
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "prefix" {
  default = "tf"
}

variable "region_name" {
  default = "virginia"
}

variable "service" {
  default = "galaxy-badge"
}

variable "stage" {
  default = "dev"
}

 variable "vpc_region" {
  description = "AWS VPC Region"
  default = "us-east-1"
 }

variable "azs" {
  description = "List of azs"
  default = ["us-east-1a", "us-east-1b"]
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default = {
    "Service" = "galaxy-badge"
    "Stage"     = "dev"
    "Creator"   = "gajender.s"
  }
}

variable "instance_type"{
  description = "Instance Type"
  default = "t3.micro"
}

variable "key_name"{
  description = "Instance Type"
  default = "gaj_test"
}