# AWS EC2 Instance Terraform module

This project consists of terraform files which will automate the infra creation as well as the app deployment.

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.63.0 |
| tls | >= 3.1.0 |

## Terraform files breakdown

| File name | Purpose |
|------|---------|
| ```data.tf```  | Finds latest amazon linux 2 AMI  |
| ```locals.tf``` | Defines local vars to create EC2 instance and security groups |
| ```main.tf``` | Calls various modules by sourcing them from various folders |

## Modules breakdown

| File name | Purpose |
|------|---------|
| ```IG``` | Terraform module to create internet gatewway  |
| ```NG``` | Terraform module to create NAT gateway |
| ```SG``` | Terraform module to create security groups |
| ```VPC``` | Terraform module to create a VPC |
| ```Subnet``` | Terraform module to create subnets |
| ```EC2``` | Terraform module to create EC2 instances |

## Usage
Make sure the AWS cli is configured on your local machine.
Run terraform init: ```terraform init```
Then run terraform apply: ```terraform apply```

## Purpose
The terraform apply operations create the following resources:
1 VPC
3 private subnets - none is used
3 NAT gateways - 1 for each private subnet - none is used
3 public subnets - only 1 is used
1 internet gateway
1 security group with ports 3000 and 22 whitelisted for all
1 EC2 instance with a public IP in a public subnet
1 AWS SSH key pair to access the instance for debugging purposes.

Finally the user data that the instance gets created with does the following things:
* Install docker
* Create the docker image through the custom docker file
* Create the docker containers via the docker compose file
* 2 containers are created:
-- postgres db
-- servian app
* The servian container automatically creates the DB and populates it with the required values.

We can finally view the endpoints on the public ip of the instance using:
```<public ip of instance>:3000```
