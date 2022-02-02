data "template_file" "ws" {
  template = var.template
}

terraform {
  required_providers {
    alb = {
      source  = "hashicorp/aws"
      version = "~> 3.72"
    }
  }

   required_version = ">= 0.13.5"
}

resource "aws_instance" "ws" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  user_data              = data.template_file.ws.rendered
  availability_zone      = var.availability_zone

  # subnet_id              = var.subnet_id

  # provisioner "local-exec" {
  #   command = "curl http://${self.public_ip}"
  # }

  tags = {
    Name = var.name
  }

  credit_specification {
    cpu_credits = "standard"
  }
}

