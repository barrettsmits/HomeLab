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
The first ansible playbook, is a setup for localhost, or the ansible host, depending on your needs. If the playbooks are ran in order, there is a major reduction in failures.  

## The main points
* Configuration is set in `ansible.cfg`. This exists only to tell Ansible where to look for server definitions (inventory). Located in /etc/ansible
    * See Examples folder for example ansible.cfg, hosts, and unencypted creds.yml files. These example files can be used as a starting point or reference.
* Servers (inventory) are defined in the `hosts` file and are placed in "groups" defined by `[]`. Located in /etc/ansible 
* `creds.yml` will need to be created via `ansible-vault create` in the appropriate folder and will need to be configured like so:

ansible-vault create creds.yml:

```
---
vault_api_password: 'PROXMOX_HOST_PASSWORD'
vault_prometheus_password: 'Prometheus_Password'
```

The primary goal of this is to automate my homelab, this is a work in process and will be updated as I work on my HomeLab.

## HomeLab details
Proxmox VE HomeLab setup using Ansible.

Initial config for localhost (Ansible host), Proxmox VE Host, multiple VMs (Prometheus, Portainer, Vault) and hosts for K3s containerization.

## 1-localhost_setup 
* Configures the localhost that is running ansible code to meet the requirements to run furtur playbooks.
* Should only need to be ran once, but can be used to setup a remote Ansible host as well.
* Run `ansible-playbook ./playbooks/1-localhost_setup.yml` to run the initial playbook. 
* 

Initiates Proxmox VE setup; creating groups, users, permisisons, pools, and the option to create an API key if it doesn't exist. (Output to terminal). 




Ansible Playbook does not have a check for localhost requirements, if local requirements are not met, run playbook: 1-localhost_setup.yml



NOTE for WSL2 installs of Ansible
Possible error may be encountered: 

Error: supermin: failed to find a suitable kernel (host_cpu=x86_64).

Fix:
sudo apt-get install linux-image-generic