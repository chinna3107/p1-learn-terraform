resource "aws_instance" "instance" {
  for_each               = var.components
  ami                    = var.ami
  instance_type          = var.instance_type
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
  records = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null)]
}

