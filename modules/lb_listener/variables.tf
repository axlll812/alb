variable "load_balancer_arn" {
   type = string
   default = ""
   description = "myload_balancer_arn"
}
 
variable "port" {
   type = number
   description = "myport"
}

variable "protocol" {
   type = string
   default = ""
   description = "myprotocol"
}

variable "default_action" {
   type = string
   default = ""
   description = "mydefault_action"
}

variable "target_group_arn" {
   type = string
   default = ""
   description = "mytarget_group_arn"
}