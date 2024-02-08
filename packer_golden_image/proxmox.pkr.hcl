locals {
  linux_notes               = "Template based on ${var.os_family}-${var.os_version} with CIS hardening, built using packer on {{ isotime \"2006-01-02\" }} at {{isotime \"3:04PM\"}}"
  win_notes                 = "Template based on ${var.os_family} ${var.os_version}, built using packer on {{ isotime \"2006-01-02\" }} at {{isotime \"3:04PM\"}}"
  vm_name                   = "${var.os_family}-${var.os_version}"
  vm_id                     = "9998"
  ver-num                   = "v2"
  vault_connection_password = vault("/secret/data/packer", "vault_ssh_connection")
  vault_proxmox_password    = vault("/secret/data/packer", "vault_proxmox_password")
}

## ubuntu source
source "proxmox-iso" "ubuntu" {
  # Proxmox settings
  proxmox_url              = var.proxmox_url
  username                 = var.proxmox_username
  password                 = local.vault_proxmox_password
  insecure_skip_tls_verify = var.proxmox_connection
  node                     = var.proxmox_node

  # VM Settings
  unmount_iso            = true
  ssh_username           = var.connection_username
  ssh_password           = local.vault_connection_password
  ssh_timeout            = var.timeout
  ssh_handshake_attempts = "100"
  ssh_port               = "22"
  iso_file               = var.os_iso_path
  iso_checksum           = var.iso_checksum
  vm_name                = "packer-${local.vm_name}"
  vm_id                  = local.vm_id
  os                     = var.guest_os_type
  // onboot                 = true

  network_adapters {
    bridge = var.vm_bridge
    model  = var.nic_type
  }
  disks {
    disk_size    = var.root_disk_size
    type         = var.disk_type
    storage_pool = var.storage_pool
    format       = var.root_disc_format
  }
  sockets      = var.num_cpu
  cores        = var.num_cores
  memory       = var.vm_ram
  boot_wait    = "10s"
  boot_command = var.boot_command
  additional_iso_files {
    cd_files = [
      "./http/meta-data",
      "./http/user-data"
    ]
    cd_label         = "cidata"
    iso_storage_pool = "local"
  }
  template_name        = "goldenimage-${local.vm_name}-${local.ver-num}"
  template_description = local.linux_notes
}

## ubuntu build
build {
  sources = [
    "source.proxmox-iso.ubuntu",
  ]

  provisioner "shell" {
    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
      "ls /"
    ]
  }

  provisioner "ansible" {
    playbook_file = "./ansible/ubuntu/setup-playbook.yml"
  }

  post-processor "shell-local" {
    inline = [
      "ssh root@192.168.1.205 'qm set ${local.vm_id} --delete ide3 && qm set ${local.vm_id} --delete ide2'"
    ]
  }
}
  //   provisioner "ansible" {
  //     playbook_file = "./boot_config/ubuntu/fix_autoupdate.yml"
  //   }

  //   provisioner "ansible" {
  //     playbook_file = "/etc/ansible/playbook/home.yml"
  //   }

  //   provisioner "shell" {
  //     execute_command = "sudo -S bash {{ .Path }}"
  //     script          = "./boot_config/ubuntu/post_cleanup.sh"
  //   }
