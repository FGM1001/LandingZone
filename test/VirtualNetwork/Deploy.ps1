

terraform init -upgrade 
#terraform validate
terraform plan -out .terraform/templates.tfplan 
terraform apply -auto-approve ".terraform/templates.tfplan"


terraform destroy -auto-approve 
az keyvault purge -n KVT-TERRA-FNIETO-DEV -l westeurope