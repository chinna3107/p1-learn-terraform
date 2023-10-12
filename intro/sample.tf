# plain variable
variable "fruit_name" {

  default = "apple"

}

# output variable

output "fruit_name" {
  value=var.fruit_name
}

variable "fruits" {
  default = [
    "apple",
    "banana"
  ]
  // default = [ "apple", "banana"]
}

# map variable, plain
variable "fruit_stock" {

  default = {
    apple = 100
    banana = 200
   }
}

# map variable, map of map
variable "fruit_stock_with_price" {
  default = {
    apple = {
      stock = 100
      price = 20
    }
    banana = {
      stock = 200
      price = 5
    }
  }
}




