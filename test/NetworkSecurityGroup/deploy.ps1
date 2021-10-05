
Connect-AzAccount

get-azcontext -ListAvailable
get-azcontext


az login

terraform init -upgrade
#terraform validate
terraform plan -out .terraform/templates.tfplan 
terraform apply -auto-approve ".terraform/templates.tfplan"


terraform destroy -auto-approve 


$VNET = Get-AzVirtualNetwork -name "WZ-AZ-PROD-EUWE-NETHUB-01"