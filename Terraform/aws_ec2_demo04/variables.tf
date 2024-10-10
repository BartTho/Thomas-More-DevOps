#-----------------
#General Variables
#-----------------
variable "availability_zone" {
  description = "Availability Zones for the Subnet"
  type        = string
}

variable "aws_region"{
  description = "region"
  type = string
}

#------------------
#Key Pair Variables
#------------------
variable "key_pair_name" {
  description = "Key Pair for ssh access to instance"
  type        = string
}

variable "file_name" {
  description = "Name of the key pair file"
  type        = string
}

#------------------
#Instance Variables
#------------------

variable "ec2_instance_name" {
  type        = string
  description = "The name to give the instance."
}

variable "counter" {
  description = "Number of instances to launch"
  type        = number
}

#----------------
#Subnet Variables
#----------------
variable "cidr_block" {
  description = "CIDR Block"
  type        = string
}
