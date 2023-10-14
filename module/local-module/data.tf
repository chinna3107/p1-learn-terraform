


output "ami" {
  value = data.aws_ami.ami
}

resource "aws_instance" "instance" {
   ami                     = data.aws_ami.ami.id
  instance_type            = var.instance_type
  vpc_security_group_ids   = [ "sg-0c786c9e56b3a46f3" ]

}

 variable "instance_type" {}
