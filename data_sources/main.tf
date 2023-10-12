data "aws_ami" "ami" {
  most_recent = true
  // name_regex  = "Centos.*"
  ami_id = ["ami-07ecd1d0c2a8a881d"]
  owners      = ["683468297985"]
}
