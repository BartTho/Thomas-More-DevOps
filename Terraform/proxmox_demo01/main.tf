resource "proxmox_vm_qemu" "cloudinit-k3s-master" {
    target_node = "proxmox1"
    desc = "Cloudinit Ubuntu"
    count = 2
    onboot = true
    clone = "ubuntu-cloud"

    agent = 0
    os_type = "cloud-init"
    cores = 1
    sockets = 1
    numa = true
    vcpus = 0
    cpu_type = "host"
    memory = 2048
    name = "k3s-master-0${count.index + 1}"

    scsihw   = "virtio-scsi-single" 
    bootdisk = "scsi0"

    disks {
        scsi {
            scsi0 {
                disk {
                  storage = "local-lvm"
                  size = 12
                }
            }
        }
    }

    ipconfig0 = "ip=192.168.3.20${count.index + 1}/22,gw=192.168.1.1"
    ciuser = "ubuntu"
    nameserver = "192.168.1.1"
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3Nza...
    ssh-ed25519 AAAAC3Nza...
    ssh-rsa AAAAB3NzaC1yc...
    EOF
}
