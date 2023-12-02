# Barrett's Ansible + Proxmox Homelab Automation

## What is this?
This repo contains the Ansible playbooks and configuration used to manage and automate my Proxmox based homelab. It makes use of the [proxmox](https://docs.ansible.com/ansible/latest/modules/proxmox_module.html) and [proxmox_kvm](https://docs.ansible.com/ansible/latest/modules/proxmox_kvm_module.html) modules.

## Requirements
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
* [python >= 3.10](https://www.python.org/downloads/)
* [proxmoxer](https://pypi.org/project/proxmoxer/)
* [requests](https://pypi.org/project/requests/)


## Installation
[Clone this repo](https://github.com/barrettsmits/HomeLab)
Ensure you also have [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) (and all other requirements) installed

## The main points
* Configuration is set in `ansible.cfg`. This exists only to tell Ansible where to look for server definitions (inventory). Located in /etc/ansible
* Servers (inventory) are defined in the `hosts` file and are placed in "groups" defined by `[]`. Located in /etc/ansible 
* `creds.yml` will need to be created via `ansible-vault create` in the appropriate folder and will need to be configured like so:

ansible-vault create creds.yml:

```---
vault_api_password: 'PROXMOX_HOST_PASSWORD'
vault_prometheus_password: 'Prometheus_Password'
```

After setting up everything, run `ansible-playbook homelab-setup.yml` to run the playbook. 

The primary goal of this is to automate my homelab, this is a work in process and will be updated as I work on my HomeLab.