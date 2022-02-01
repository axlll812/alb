variable "name" {
   type = string
   default = ""
   description = "myname"
}

variable "internal" {
   type = bool
   # default = false
   description = "myiternal"
}

variable "security_groups" {
   type = list(string)
   default = []
   description = "mysecurity_groups"
}

variable "load_balancer_type" {
   type = string
   default = ""
   description = "myload_balancer_type"
}

variable "subnets" {
   type = list(string)
   default = []
   description = "mysubnets"
}

variable "enable_deletion_protection" {
   type = bool
   # default = 
   description = "myenable_deletion_protection"
}

variable "environment" {
   type = string
   default = ""
   description = "myenvironment"
}