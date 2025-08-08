variable "vm_name"       { type = string }
variable "labels"        { type = map(string) }
variable "cloud_init"    { type = string }

variable "platform_id"   { type = string }
variable "cores"         { type = number }
variable "memory"        { type = number }
variable "core_fraction" { type = number }
variable "disk_size"     { type = number }
variable "preemptible"   { type = bool }

variable "subnet_id"     { type = string }
variable "nat"           { type = bool }
variable "image_id"      { type = string }