terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tickets"

    workspaces {
      name = "ticket_22711"
    }
  }
}

provider "aws" {
  version = "~> 2.45.0"
  region = "us-east-1"
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

output "out" {
  value = data.aws_ami.ubuntu.id
}

output "out1" {
  value = data.aws_ami.ubuntu.id
}