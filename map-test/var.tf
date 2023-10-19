variable "vpc" {
  default = {
    main = {
      cidr = "10.0.0.0/16"
      subnet = {
        public = {
          public1 = { cidr = "10.0.0.0/24", az = "us-east-1a" }
          public2 = { cidr = "10.0.1.0/24", az = "us-east-2a" }
        }
        app = {
          app1 = { cidr = "10.0.2.0/24", az = "us-east-1a" }
          app2 = { cidr = "10.0.3.0/24", az = "us-east-2a" }
        }
        db = {
          db1 = { cidr = "10.0.4.0/24", az = "us-east-1a" }
          db2 = { cidr = "10.0.5.0/24", az = "us-east-2a" }
        }
      }
    }
  }
}

output "all_subent" {
   value = var.vpc["main"] ["subnet"]
}

#output "all_subnets" {
#  value = { for k,v in merge(var.vpc["main"]["subnets"]): k => v  }
#}

locals {
  public = { for k, v in merge(var.vpc["main"]["subnet"]["public"]) : k => v }
  app    = { for k, v in merge(var.vpc["main"]["subnet"]["app"]) : k => v }
  db     = { for k, v in merge(var.vpc["main"]["subnet"]["db"]) : k => v }
}

output "all_subnets" {
  value = merge(local.public, local.db, local.app)
}