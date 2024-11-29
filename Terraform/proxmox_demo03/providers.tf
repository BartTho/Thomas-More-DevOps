terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://192.168.3.150:8006/api2/json"

    pm_user = "root@pam"
    pm_password = "Top.Secret"
}
