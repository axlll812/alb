terraform {
  required_providers {
    alb = {
      source  = "hashicorp/aws"
      version = "~> 3.72"
    }
  }

   required_version = ">= 0.13.5"
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = var.public_key
}

# data "aws_key_pair" "example" {
#   key_name = "axl-key"
  # key_id = "key-02e560cb90241b31f"
  # filter {
  #   name   = "Name"
  #   values = ["axl-key"]
  # }
# }