output "public_DNS" {
  value = module.instance[*].public_dns
}

output "instance_id" {
  value = module.instance[*].ec2_id
}

output "availability_zone" {
   value = module.instance[*].availability_zones
}

output "target_group_arn" {
  value = module.lb_target_group[*].tg_arn
}

output "lb_dns_name" {
  value = module.lb[*].ws_dns_name
}