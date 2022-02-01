variable "template" {
   type = string
   default = ""
   description = "mytemplate"
}

variable "ami" {
   type = string
   default = ""
   description = "myami"
}

variable "instance_type" {
   type = string
   default = ""
   description = "myami"
}

variable "vpc_security_group_ids" {
   type = list(string)
   default = []
   description = "myvpc_security_group_ids"
}

variable "key_name" {
   type = string
   default = ""
   description = "mykey_name"
}

variable "name" {
   type = string
   default = ""
   description = "my_name"
}

variable "availability_zone" {
   type = string
   default = ""
   description = "myavailability_zone"
}

variable "subnet_id" {
   type = string
   default = ""
   description = "mysubnet_id"
}