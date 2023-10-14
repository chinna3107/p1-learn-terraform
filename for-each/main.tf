variable "components" {
  default = {
    frontend = { name = "frontend-sg" }
    catalogue = { name = "catalogue-sg" }
  }
}

resource "aws_security_group" "allow_tls" {

  for_each = var.components
  name = lookup (var.components, each.value["name"], null )

}