terraform {
  required_providers {
    alb = {
      source  = "hashicorp/aws"
      version = "~> 3.72"
    }
  }

    required_version = ">= 0.13.5"
}

resource "aws_lb_target_group" "tg_lb" {
  name           = var.name
  port           = var.port
  protocol       = var.protocol
  vpc_id         = var.vpc_id
  target_type    = var.target_type
}

resource "aws_lb_target_group_attachment" "group_attachment_lb" {
  # for_each = {
  #   for pair in setproduct(keys(aws_lb_target_group.tg_lb), var.instance_ec2_id) : "${pair[0]}:${pair[1]}" => {
  #     # target_group = aws_lb_target_group.tg_lb[pair[0]]
  #     # instance_id  = var.instance_ec2_id[pair[1]]
  #   }
  # }

  # target_group_arn = each.value.target_group
  # target_id        = each.value.instance_id
  target_group_arn = aws_lb_target_group.tg_lb.arn
  target_id        = var.instance_ec2_id
  port             = var.port
}