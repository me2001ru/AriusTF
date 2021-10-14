# Aries - Oumph

Getting started with developing:
- Download this repository
- Download provider plugin (RC File)
- install terraform
- open the versions.tf and remove/comment out lines 13-18
- source the rc file to set environmental variables used for authenticating to openstack

### Terraform commands:
- Initialize:       ```terraform init```
- Display plan:     ```terraform plan```
- Format:           ```terraform fmt [-check] [-diff]```
- Validate:         ```terraform validate```
- Plan:             ```terraform plan```
- Apply:            ```terraform apply -auto-approve```
- Destroy:          ```terraform destroy```
