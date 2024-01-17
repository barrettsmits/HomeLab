REQUIREMENTS:

Setup a local vault with the needed creds, or comment out the Vault lines and add your own passwords.

HashiCorp VAULT getting started install. https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-install

Create a secret called "packer" with your vault_proxmox_password and vault_ssh_connection passwords.

Local dev is being by running "vault server -dev"

GOTCHAs I experienced:

Https vs http for local vault:
Fixed by:
    
    export VAULT_ADDR='http://127.0.0.1:8200' 

Don't forget to export the root token as well. 

    export VAULT_TOKEN='the token created when starting vault'

You'll need to recreate the vault each time it is intialized. 
    vault kv put -mount=secret packer vault_proxmox_password=password vault_ssh_connection=password


Build command from packer folder: 
    packer build -var-file 22.04.pkrvars.hcl .

TODO:
Homelab Vault server build and automation of local vars for it. 