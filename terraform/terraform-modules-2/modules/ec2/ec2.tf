provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-018875e7376831abe"
    instance_type = "t2.micro"
    tags = {
        Name = "ec2_example"
    }
}