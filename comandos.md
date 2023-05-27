- terraform plan -var-file="dev.tfvars"
- terraform apply -var-file="dev.tfvars" -auto-approve
- terraform apply -auto-approve

- terraform plan -out="tfplan.out" -var-file="./tf-vars/dev.tfvars"
- terraform apply "tfplan.out"

- terraform init -backend=true -backend-config="./dev.backend.hcl"

- terraform destroy -var-file="./tf-vars/dev.tfvars"
