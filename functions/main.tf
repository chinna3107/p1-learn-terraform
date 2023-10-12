variable "fruits" {
  default = [ "apple", "banana"]
}

output "fruit" {
  //value =  var.fruits[2]
  value = element(var.fruits,2)
}

variable "fruit_with_Stock" {
  default = {
     apple = 100
  }
}

output "fruit_stock"{
  value = try(var.fruit_with_Stock["banana"],0)
}

output "fruit_stock_price" {

  value = lookup(var.fruit_with_Stock["apple"], "price" ,2)

}