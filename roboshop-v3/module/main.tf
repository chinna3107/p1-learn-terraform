resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group

  tags = {
    Name = var.Name
   }

   provisioner  "local-exec" {
   command = "sleep 60"
 }
}
resource "aws_route53_record" "record" {
  zone_id = var.zion_id
  name    = "${var.Name}-dev.devops-tools.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}

