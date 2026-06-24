variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vpc_name" {
  type    = string
  default = "develop"
}

variable "default_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "family_name" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "common_platform" {
  type    = string
  default = "standard-v1"
}

variable "common_core_fraction" {
  type    = number
  default = 20
}

variable "preempt_on" {
  type    = bool
  default = true
}


variable "web_cores" {
  type    = number
  default = 2
}

variable "web_memory" {
  type    = number
  default = 1
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    { vm_name = "main",    cpu = 2, ram = 2, disk_volume = 10 },
    { vm_name = "replica", cpu = 2, ram = 1, disk_volume = 5 }
  ]
}

variable "nat_is_on" {
  type    = bool
  default = true
}