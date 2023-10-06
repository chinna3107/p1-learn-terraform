resource "aws_instance" "web" {
  ami =  "ami-07ecd1d0c2a8a881d"

  tag = {

     Name = "Hello world"
  }

}