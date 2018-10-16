provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "iac_begin" {
  ami = "${var.ami}"
  instance_type = "${var.size}"
  key_name = "mainkey-pub"
  security_groups = ["${aws_security_group.secgroup1.name}"]
}
resource "aws_vpc" "original" {
  cidr_block = "172.128.64.0/24"
  enable_dns_hostnames = "True"
}
resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.original.id}"
  cidr_block = "172.128.64.20/25"
}
resource "aws_security_group" "secgroup1" {
  name = "nginxdefault"
  description = "SOme default ports for nginx"
  vpc_id = "${aws_vpc.original.id}"
  

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "${var.myip}"

  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "${var.myip}"

  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "mainkey" {
  key_name = "mainkey-pub"
  public_key = "${var.pub_key}"
}
