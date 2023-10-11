terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-1"
}
data "aws_ami" "ubuntu" {

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.image_id
  subnet_id     = "subnet-05154620af764d729"
  instance_type = "t2.micro"
  #      provisioner "file" {
  #         source      = "hello-world.txt"
  #         destination = "/home/ubuntu/hello-world.txt"

  #     connection {
  #       type        = "ssh"
  #       user        = "ubuntu"
  #       private_key = "${file("key.pem")}"
  #       host        = hostip
  #     }
  #    }
  user_data = <<EOF
#!/bin/bash
echo "foo" > /home/ubuntu/hello-world.txt
EOF
  tags = {
    Name = "ExampleAppServerInstance"
  }
}
