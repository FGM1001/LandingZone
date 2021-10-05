# Script para las pruebas de despliegue de la infraestructura


az account clear
az login

terraform init -upgrade
#terraform validate
terraform plan -out .terraform/templates.tfplan 
terraform apply -auto-approve ".terraform/templates.tfplan"


terraform destroy -auto-approve 