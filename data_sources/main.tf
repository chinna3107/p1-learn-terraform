data "aws_ami" "ami" {
  most_recent = true
 name_regex  = "web.*"
  owners      = ["683468297985"]
}

output "ami" {
  value = data.aws_ami.ami
}