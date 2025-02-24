# Barrett's Ansible + Proxmox Homelab Automation

## Overview
This repository contains Ansible playbooks and configuration for managing and automating a Proxmox-based homelab environment. It leverages the [proxmox](https://docs.ansible.com/ansible/latest/modules/proxmox_module.html) and [proxmox_kvm](https://docs.ansible.com/ansible/latest/modules/proxmox_kvm_module.html) Ansible modules.

## Prerequisites
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
- [Python >= 3.10](https://www.python.org/downloads/)
- Python packages:
  - [proxmoxer](https://pypi.org/project/proxmoxer/)
  - [requests](https://pypi.org/project/requests/)

## Quick Start
1. [Clone this repository](https://github.com/barrettsmits/HomeLab)
2. Install Ansible and other prerequisites
3. Run the initial setup playbook for your Ansible host:
   ```bash
   ansible-playbook ./playbooks/1-localhost_setup.yml
   ```

## Configuration

### Directory Structure
- `ansible.cfg` - Core Ansible configuration (located in `/etc/ansible`)
- `hosts` - Inventory file defining servers and groups (located in `/etc/ansible`)
- `creds.yml` - Encrypted credentials file (must be created)
- Example configurations can be found in the `Examples` folder

### Setting Up Credentials
1. Create an encrypted credentials file:
   ```bash
   ansible-vault create creds.yml
   ```

2. Add the following content:
   ```yaml
   ---
   vault_api_password: 'PROXMOX_HOST_PASSWORD'
   vault_prometheus_password: 'Prometheus_Password'
   ```

## Playbooks

### 1. localhost_setup.yml
- Configures the Ansible host with all required dependencies
- Only needs to be run once per Ansible host
- Can be used for both local and remote Ansible host setup
- Run with:
  ```bash
  ansible-playbook ./playbooks/1-localhost_setup.yml
  ```

### Additional Playbooks
- Proxmox VE setup
- VM creation (Prometheus, Portainer, Vault)
- K3s containerization host configuration

## HomeLab Components
- Proxmox VE host
- Multiple VMs:
  - Prometheus monitoring
  - Portainer container management
  - HashiCorp Vault
  - K3s cluster nodes

## Troubleshooting

### WSL2 Installation Issues
If you encounter the following error:
```
Error: supermin: failed to find a suitable kernel (host_cpu=x86_64)
```

Fix by installing the generic Linux kernel:
```bash
sudo apt-get install linux-image-generic
```

## Notes
- Run playbooks in the specified order to minimize failures
- The configuration automatically sets up Proxmox groups, users, permissions, pools, and optionally creates an API key
- Check the Examples folder for reference configuration files