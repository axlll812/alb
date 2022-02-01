terraform {
  required_providers {
    alb = {
      source  = "hashicorp/aws"
      version = "~> 3.72"
    }
  }

    required_version = ">= 0.13.5"
}

resource "aws_lb_listener" "ws_listener" {
  load_balancer_arn    = var.load_balancer_arn
  port                 = var.port
  protocol             = var.protocol

  default_action {
    type               = var.default_action
    target_group_arn   = var.target_group_arn
    
  }  
}