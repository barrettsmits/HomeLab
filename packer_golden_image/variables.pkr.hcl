variable "proxmox_url" {
  default = "https://192.168.1.205:8006/api2/json"  # your Proxmox Host url. use 
}
variable "proxmox_username" {
  default = "root@pam"
}
variable "proxmox_password" {
  description = "Password to authenticate to proxmox"
  default     = "" # Used HCL Vault, can be clear text if needed
}
variable "proxmox_connection" {
  description = "true/false insecure_connection to proxmox"
  default     = "true"
}
variable "proxmox_node" {
  default = "proxmox" # set your node name
}
variable "connection_username" {
  description = "username to connect to vm during build process"
  default     = "ansibleadmin" # set your ssh username 
}
variable "connection_password" {
  description = "password to connect to vm during build process"
  default     = "" # Used HCL Vault, can be clear text if needed
}
variable "timeout" {
  description = "average build time is around 11 minutes, 25 minutes should be enough"
  default     = "25m"
}
variable "iso_checksum" {}
variable "os_version" {}
variable "os_iso_path" {}
variable "guest_os_type" {
  default = "l26"
}
variable "storage_pool" {
  default = "LVM-Prime"
}
variable "disk_type" {
  default = "scsi"
}
variable "root_disc_format" {
  default = "raw"
}
variable "root_disk_size" {
  default = "20g"
}
variable "nic_type" {
  default = "virtio"
}
variable "vm_bridge" {
  default = "vmbr0"
}
variable "num_cpu" {
  default = 2
}
variable "num_cores" {
  default = 2
}
variable "vm_ram" {
  default = 2048
}
variable "os_family" {
  description = "OS Family builds the paths needed for packer"
  default     = ""
}
variable "boot_command" {} #set in specific var file