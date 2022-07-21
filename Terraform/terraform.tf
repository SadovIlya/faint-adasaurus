provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "Ubuntu" {
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t2.micro"
  key_name = "keys"
  tags = {
    Name = "Ubuntu"
  }
}