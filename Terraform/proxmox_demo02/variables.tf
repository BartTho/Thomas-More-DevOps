variable "aantal" {
  description = "Aantal VM's"
  type        = number
  default     = "3"
}
variable "ostemplate" {
  description = "lxc template die we willen gebruiken (moet aanwezig zijn)"
  type        = string
  default     = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}
variable "os_type" {
  description = "type van de linux container"
  type        = string
  default     = "ubuntu"
}
variable "root_paswoord" {
  description = "paswoord voor de root gebruiker"
  type        = string
  default     = "Top.Secret"
}
variable "geheugen" {
  description = "hoeveel geheugen krijgt elke container"
  type        = number
  default     = "512"
}
