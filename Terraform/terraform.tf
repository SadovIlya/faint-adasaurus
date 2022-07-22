provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "Ubuntu" {
  ami                    = "ami-0d70546e43a941d70"
  instance_type          = "t2.micro"
  key_name               = "keys"
  vpc_security_group_ids = [aws_security_group.Ubuntu_instance.id]
  tags = {
    Name = "Ubuntu"
  }
}

resource "aws_security_group" "Ubuntu_instance" {
  name = "Ubuntu"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value       = aws_instance.Ubuntu.public_ip
  description = "The public IP address of the web server"
}

resource "aws_ecr_repository" "ubuntu-ecr" {
  name = "ubuntu-ecr/ubuntu-ecr" 
}