resource "aws_instance" "debian_9" {
  count         = var.ami["debian_9"]["deploy"] ? 1 : 0
  ami           = var.ami["debian_9"]["ami_id"]
  instance_type = var.machine_type
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.main.id
  ]
  subnet_id = aws_subnet.main.id
  user_data = <<EOF
#! /bin/bash
apt update
apt install -y python3 python3-apt python-apt
EOF
  tags = {
    Name   = "debian_9"
    user   = "admin"
    author = var.key_name
    type   = "ansible"
  }
}

resource "aws_instance" "ubuntu_18" {
  count         = var.ami["ubuntu_18"]["deploy"] ? 1 : 0
  ami           = var.ami["ubuntu_18"]["ami_id"]
  instance_type = var.machine_type
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.main.id
  ]
  subnet_id = aws_subnet.main.id
  user_data = <<EOF
#! /bin/bash
apt update
apt install -y python3 python3-apt python-apt
EOF
  tags = {
    Name   = "ubuntu_18"
    user   = "ubuntu"
    author = var.key_name
    type   = "ansible"
  }
}

resource "aws_instance" "centos_7" {
  count         = var.ami["centos_7"]["deploy"] ? 1 : 0
  ami           = var.ami["centos_7"]["ami_id"]
  instance_type = var.machine_type
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.main.id
  ]
  subnet_id = aws_subnet.main.id
  user_data = <<EOF
#! /bin/bash
yum update
yum install -y python3
EOF
  tags = {
    Name   = "centos-7"
    user   = "centos"
    author = var.key_name
    type   = "ansible"
  }
}

resource "aws_instance" "rhel_7" {
  count         = var.ami["rhel_7"]["deploy"] ? 1 : 0
  ami           = var.ami["rhel_7"]["ami_id"]
  instance_type = var.machine_type
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.main.id
  ]
  subnet_id = aws_subnet.main.id
  user_data = <<EOF
#! /bin/bash
yum update
yum install -y python3
EOF
  tags = {
    Name   = "rhel_7"
    user   = "ec2-user"
    author = var.key_name
    type   = "ansible"
  }
}
