
Connect-AzAccount

get-azcontext -ListAvailable
get-azcontext

az account clear
az login

terraform init -upgrade
terraform providers
#terraform validate
terraform plan -out .terraform/templates.tfplan 
terraform apply -auto-approve ".terraform/templates.tfplan"


terraform destroy -auto-approve 