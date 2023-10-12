#plain variable
variable "fruit" {
 default = apple
}

#output fruit
output "fruit" {
  value = var.fruit
}

#List of values in variable
variable "fruit_list" {
  default = [
     "apple",
     "banana"
  ]
}

# map of variable
variable "fruit_stock" {
  default = {
    apple = 100
    banana = 200
  }
}

#map of map variable
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

#Access a list of variable
output "fruit_frist" {
  value = var.fruit_stock[0]
}

output "frist_second" {
  value = var.fruit_stock[1]
}

output "fruit_frist_price" {
  value = var.fruit_stock_with_price.apple.price
}

output "fruit_second_stock" {
  value = var.fruit_stock_with_price.banana[0]
}