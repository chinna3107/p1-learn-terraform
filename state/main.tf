terraform {
  backend "s3" {
   bucket = "p1-state-tf"
   key    = "state/terraform.tfstate"
   region = "us-east"
  }
}

variable "test" {
  default = "hello"
}

output "test" {
  value = var.test
}
