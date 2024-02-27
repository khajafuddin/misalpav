terraform {
  cloud {
    organization = "wipro11"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {
      tags = ["terraformwipro"]
    }
  }
}
