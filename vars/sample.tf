#plain variable
variable "fruit" {
 default = "apple"
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
output "fruit_first" {
  value = var.fruit_list[0]
}

output "fruit_second" {
  value = var.fruit_list[1]
}

output "fruit_stock_with_apple" {
  value = var.fruit_stock_with_price["apple"].stock
}

output "fruit_price_of_banana" {
  value = var.fruit_stock_with_price["banana"].price
}

#variable data type
variable "fruit_details" {
  default = {
    apple = {
      stock = 100  # Number
      type  = washington # string
      for_sale = true  # boolean
    }
  }
}

# variable in a combination of any other string then it needs to be with in ${}

output "fruit_details_apple" {
  value = "Apple stock = ${var.fruit_details["apple"].stock} , Apple Type =${var.fruit_details["apple"].type} ,Apple sale status = ${var.fruit_details["apple"].for_sale}"
}