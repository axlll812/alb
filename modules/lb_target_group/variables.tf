variable "name" {
   type = string
   default = ""
   description = "myname"
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

variable "vpc_id" {
   type = string
   default = ""
   description = "myvpc_id"
}

variable "target_type" {
   type = string
   default = ""
   description = "target_type"
}

variable "instance_ec2_id" {
   type = string
   default = ""
   description = "instance_ec2_id"
}