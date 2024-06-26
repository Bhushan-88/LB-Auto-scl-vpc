terraform {
  backend "s3" {
    bucket = "buc-virginia"
    region = "us-east-1"
    key = "terraform.tfstate"    
  }
}

provider "aws" {
    region = us-east-1

module "my_vpc" {
    source = "./modules/vpc"
    project = "cloudblitz"
    vpc_cidr = "10.10.0.0/16"
    pri_sub_cidr = "10.10.0.0/20"
    pub_sub_cidr = "10.10.16.0/20"
    env = "dev"

}