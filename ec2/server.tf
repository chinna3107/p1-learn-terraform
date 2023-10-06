resource "aws_instance" "web" {
  ami           = "ami-07ecd1d0c2a8a881d"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}