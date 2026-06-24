locals {
  ssh_pub_key = file("~/.ssh/id_rsa.pub")
  metadata = {
    serial-port-enable = "1"
    ssh-keys            = "ubuntu:${local.ssh_pub_key}"
  }
}