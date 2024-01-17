os_version    = "22.04"
os_family     = "Ubuntu"
guest_os_type = "l26"
os_iso_path   = "local:iso/ubuntu-22.04.3-live-server-amd64.iso"
iso_checksum  = "a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd"
// tags = "Ubuntu-22.04;template"
boot_command = [
  "c<wait>",
  "linux /casper/vmlinuz",
  " autoinstall",
  " ip=dhcp::192.168.1.1:255.255.255.0::::8.8.8.8 ds=nocloud;",
  "<enter><wait5s>",
  "initrd /casper/initrd",
  "<enter><wait5s>",
  "boot",
  "<enter><wait5s>",
]
