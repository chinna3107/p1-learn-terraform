data "aws_ami_ids" "ami" {
  name_regex  = "web.*"
  owners      = ["683468297985"]
}


/*
output "ami" {
  value = data.aws_ami_ids.ami
}*/
