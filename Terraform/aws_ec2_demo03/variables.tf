variable "instantie_naam" {
  description = "Waarde voor de naam van de EC2 instantie"
  type        = string
  default     = "Voorbeeld01"
}

variable "instantie_type" {
  description = "Waarde voor de type van de EC2 instantie"
  type        = string
  default     = "t2.micro"
}

variable "instantie_ami" {
  description = "Waarde voor de image van de EC2 instantie"
  type        = string
  default     = "ami-0ebfd941bbafe70c6"
}