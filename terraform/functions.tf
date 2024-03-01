terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  features {

  }
  # Configuration options
}

locals {
  a1            = "vadapav"
  b1            = "samosa"
  c1            = 3
  vadapavformat = format("This is %s and it is very spicy", local.a1)
}

locals {
  n1 = 2
  n2 = 3
  n3 = sum([local.n1,local.n2])
  city = "Mumbai"
  marks = [33,45,67,89,65]
}
output "vadapavOutput" {
  value = local.vadapavformat
}
output "Sum-Of-N1-and-N2-is" {
  value = local.n3
}

output "lengthofcityname" {
  value = length(local.city)
}
output "lengthOfMarks" {
  value = length(local.marks)
}
