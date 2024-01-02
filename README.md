# HomeLab
Proxmox VE HomeLab setup using Ansible.
Initial config for Proxmox VE, K3s containerization, Prometheus, Portainer Pi-Hole.

Initiates Proxmox VE setup creating users, permisisons, groups, and an API key if it doesn't exist. (Output in to local file to be stored into a safe). 



Ansible Playbook has a softcheck for localhost requirements, if local requirements not met will prompt to install or end run. 



NOTE for WSL2 installs of Ansible
Possible error may be encountered: 

Error: supermin: failed to find a suitable kernel (host_cpu=x86_64).

Fix:
sudo apt-get install linux-image-generic