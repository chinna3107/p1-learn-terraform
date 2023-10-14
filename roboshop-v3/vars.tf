variable "security_group" {
  default = [ "sg-0c786c9e56b3a46f3" ]
}

variable "zone_id" {
  default = "Z02791651VB89NZU8FH7C"
}

variable "components" {
  default = {
    frontend = {
      Name = "frontend"
      instance_type = "t3.micro"
    }
    cart = {
      Name = "cart"
      instance_type = "t3.micro"
    }
  }
}