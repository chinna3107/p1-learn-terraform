variable "components" {
  default = ["frontend", "mongodb"]
}
resource "aws_instance" "instance" {

  count = length(var.components)

  ami                    = "ami-07ecd1d0c2a8a881d"
  instance_type          = "t3.small"
  vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]

  tags = {
    Name = element(var.components, count.index)
  }
}
