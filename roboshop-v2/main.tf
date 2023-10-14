  variable "ami" {
   default = "ami-07ecd1d0c2a8a881d"
  }
  
  variable "security_group" {
    default = [ "sg-0c786c9e56b3a46f3" ]
  }
  
  variable "instance_type" {
    default = "t3.small"
  }
   
   variable "zone_id" {
  default = "Z02791651VB89NZU8FH7C"
  }

  variable "components" {
    default = {
      frontend1 ={ name = "frontend" }
      mongodb1 ={ name = "mongodb" }
      catalogue1 ={ name = "catalogue" }
      redis1 ={ name = "redis" }
      user1 ={ name = "user" }
      cart1 ={ name = "cart" }
      mysql1 ={ name = "mysql" }
      shipping1 ={ name = "shipping" }
      rabbitmq1 ={ name = "rabbitmq" }
      payment1 ={ name = "payment" }
    }
  }

    resource "aws_instance" "instance" {
      for_each = var.components
        ami           = var.ami
        instance_type = var.instance_type
        vpc_security_group_ids = var.security_group

    tags = {
      Name = lookup(each.value,"name", null)
    }
  }
    
  resource "aws_route53_record" "record" {
    for_each = var.components
        zone_id = "Z02791651VB89NZU8FH7C"
    name    = "${lookup(each.value, "name", null)}.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [lookup(lookup(each.value,"name",null), "private_ip", null)]
  }

 /* resource "aws_instance" "mongodb" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]

    tags = {
    Name = "mongodb"
    }
  }

  resource "aws_route53_record" "mongodb" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "mongodb-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.mongodb.private_ip]
  }
    
    
  resource "aws_instance" "catalogue" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]
    
    tags = {
    Name = "catalogue"
    }
  }
    
  resource "aws_route53_record" "catalogue" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "catalogue-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.catalogue.private_ip]
  }
    
  resource "aws_instance" "redis" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]
    
    tags = {
    Name = "redis"
    }
  }
    
  resource "aws_route53_record" "redis" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "redis-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.redis.private_ip]
  }
    
  resource "aws_instance" "user" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]
    
    tags = {
    Name = "user"
    }
  }
    
  resource "aws_route53_record" "user" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "user-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.user.private_ip]
  }
    
   
    
  resource "aws_instance" "cart" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = ["sg-0c786c9e56b3a46f3" ]
    
    tags = {
    Name = "cart"
    }
  }
    
  resource "aws_route53_record" "cart" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "cart-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.cart.private_ip]
  }
    
  resource "aws_instance" "mysql" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]
    
    tags = {
    Name = "mysql"
    }
  }
    
  resource "aws_route53_record" "mysql" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "mysql-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.mysql.private_ip]
  }
    
  resource "aws_instance" "shipping" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]
    
    tags = {
    Name = "shipping"
    }
  }
    
  resource "aws_route53_record" "shipping" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "shipping-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.shipping.private_ip]
  }
    
  resource "aws_instance" "rabbitmq" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]
    
    tags = {
    Name = "rabbitmq"
    }
  }
    
  resource "aws_route53_record" "rabbitmq" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "rabbitmq-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.rabbitmq.private_ip]
  }
    
  resource "aws_instance" "payment" {
    ami           = "ami-07ecd1d0c2a8a881d"
    instance_type = "t3.small"
    vpc_security_group_ids = [ "sg-0c786c9e56b3a46f3" ]
    tags = {
    Name = "payment"
    }
  }
    
  resource "aws_route53_record" "payment" {
    zone_id = "Z02791651VB89NZU8FH7C"
    name    = "payment-dev.devops-tools.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.payment.private_ip]
  }*/