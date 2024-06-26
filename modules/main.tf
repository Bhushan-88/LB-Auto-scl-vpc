resource "aws_vpc" "my_vpc" {
    cidr_block = "10.10.0.0/16"
    tags = {
      Name = "${var.project}-vpc"
      env = var.env
    }
}

resource "aws_subnet" "pri_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
      Name = "${var.project}-private-subnet"
      env = var.env
    }
}

resource "aws_subnet" "pub_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.10.0.0/24"

    tags = {
      Name = "${var.project}-public-subnet"
      env = var.env
    }
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = "${var.project}-igw"
  
}

resource "aws_default_route_table" "example" {
  default_route_table_id = aws_vpc.example.default_route_table_id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }


  tags = {
    Name = "example"
  }
}