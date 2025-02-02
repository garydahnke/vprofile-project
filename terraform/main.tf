provider "aws" {
    region = "us-east-2"
}

variable "instance_type" {
    type = map(string)
    default = {
        "default" : "t2.small",
        "dev" : "t2.micro",
        "uat" : "t2.small",
        "prod" : "t2.medium"
    }
}

resource "aws_instance" "ec2" {
    ami = "ami-018875e7376831abe"
    instance_type = lookup(var.instance_type,"${terraform.workspace}")
    tags = {
        Name = "ec2_example"
    }
}

output "workspace" {
    value = "Terraform workspace: ${terraform.workspace}"
}