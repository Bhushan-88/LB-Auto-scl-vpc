resource "aws_instance" "my_instance" {
    ami = var.image_id
    count = var.count
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    key_name = var.key_pair

    tags = {
      Name = "${var.project}-instance"
      env = var.env
        }
        subnet_id = var.subnet_id
    }

