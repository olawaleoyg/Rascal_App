###-------------------



terraform fmt

terraform init -backend-config=./environments/dev/backend.txt

terraform validate

terraform plan

terraform apply -var-file=./environments/dev/values.tfvars 


## Change to other environment

terraform init -backend-config=./environments/pro/backend.txt -reconfigure

