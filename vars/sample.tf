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

# Access a list variable, List index starts from zero

output "fruits_first" {
  value = var.fruits[0]
}

output "fruits_second" {
  value = var.fruits[1]
}

output "fruit_stock_apple" {
  value = var.fruit_stock["apple"]
}

