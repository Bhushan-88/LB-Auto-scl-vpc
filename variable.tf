variable "projrct" {
    default = "cloudblitz"
}
variable "vpc_cidr" {
    default = "10.10.0.0/16"
}
variable "environment" {
  default = "dev"
}
variable "private" {
  default = "10.10.0.0/20"
}
variable "public_cidr" {
  default = "10.10.16.0/20"
}