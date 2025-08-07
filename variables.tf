# variables.tf (корень проекта)
variable "yc_token" {
  description = "Yandex.Cloud IAM Token"
  type        = string
}

variable "yc_cloud_id" {
  description = "Yandex.Cloud Cloud ID"
  type        = string
}

variable "yc_folder_id" {
  description = "Yandex.Cloud Folder ID"
  type        = string
}

variable "yc_zone" {
  description = "Yandex.Cloud Zone"
  type        = string
}

variable "ssh_public_key" {
  description = "Public SSH key to inject into VM"
  type        = string
}