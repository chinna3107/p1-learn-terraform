# plain variable
variable "fruit_name" {

  default = "apple"

}

# output variable

output "fruit_name" {
  value=var.fruit_name
}



