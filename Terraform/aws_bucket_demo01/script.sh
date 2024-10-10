#!/bin/bash
terraform init
terraform plan
terraform apply

terraform output instance_id

terraform destroy