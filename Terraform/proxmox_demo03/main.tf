resource "proxmox_lxc" "basic" {
  target_node  = "proxmox1"
  count = var.aantal
  hostname     = "server-0${count.index + 1}"
  vmid         = "${count.index + 200}"
  ostemplate   = var.ostemplate
  ostype       = var.os_type
  unprivileged = true
  password     = var.root_paswoord
  memory = var.geheugen
  hastate="started"
  ssh_public_keys = <<-EOT
    ssh-rsa AAAAB3Nza...
    ssh-ed25519 AAAAC...
  EOT
  // We moeten een rootfs aanmaken !
  rootfs {
    storage = "local-lvm"
    size    = "20G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    # ip     = "dhcp"
    ip     = "192.168.1.3${count.index + 1}/24,gw=192.168.1.1"
  }
  nameserver = "192.168.1.1"
}
