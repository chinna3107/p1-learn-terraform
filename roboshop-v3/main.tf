module "components" {
 for_each = var.components

  source          = "./module"
  zion_id         = var.zone_id
  security_group  = var.security_group
  name            = each.value["Name"]
  instance_type   = each.value["instance_type"]
}



