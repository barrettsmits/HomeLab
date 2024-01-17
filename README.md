# HomeLab
Proxmox VE HomeLab setup using Ansible.
Initial config for Proxmox VE, K3s containerization, Prometheus, Portainer Pi-Hole.

Initiates Proxmox VE setup creating users, permisisons, groups, and an API key if it doesn't exist. (Output in to local file to be stored into a safe). 



Ansible Playbook does not have a check for localhost requirements, if local requirements are not met, run playbook: ./misc_books/localhost_setup.yml



NOTE for WSL2 installs of Ansible
Possible error may be encountered: 

Error: supermin: failed to find a suitable kernel (host_cpu=x86_64).

Fix:
sudo apt-get install linux-image-generic