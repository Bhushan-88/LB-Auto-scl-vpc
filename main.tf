terraform {
  backend "s3" {
    bucket = "buc-virginia"
    region = "us-east-1"
    key = "terraform.tfstate"    
  }
}

provider "aws" {
    region = var.region
}

module "my_vpc_module" {
    source = "./modules/vpc"
    project = var.project
    vpc_cidr = var.vpc_cidr
    pri_sub_cidr = var.private_cidr
    pub_sub_cidr = var.public_cidr

}

module "my_instance" {
    source = "./modules/instance"
  
}