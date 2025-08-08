variable "token" {
  description = "Yandex.Cloud IAM token"
  type        = string
}

variable "cloud_id" {
  description = "Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID"
  type        = string
}

variable "default_zone" {
  description = "Zone (e.g. ru-central1-a)"
  type        = string
}

variable "ssh_public_key" {
  description = "Public SSH key for cloud-init"
  type        = string
}

variable "platform_id" {
  type    = string
  default = "standard-v3"
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2
}

variable "core_fraction" {
  type    = number
  default = 20
}

variable "disk_size" {
  type    = number
  default = 10
}

variable "preemptible" {
  type    = bool
  default = true
}

variable "nat" {
  type    = bool
  default = true
}

variable "subnet_id" {
  description = "e9bh8irb5avpo7auq9fg"
  type        = string
}

variable "image_id" {
  description = "fd8e4gcflhhc7odvbuss"
  type        = string
}