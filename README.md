# Welcome - Terraform for aws-vpc 
This terraform  will create
1. One VPC ( 3 Public & private subnet, NAT gateway and Internet Gateway)
2. Two ubuntu instances, and install nginx on them using userdata.sh 
3. Autoscaling for instance upto 4 
4. Security group for exposing port 80 and allow all outgoing traffic
5. Route 53 A Record poiting to the NAT gateway of VPC

# Getting started
Make sure you have the latest terraform installed </br>
Or download linux binary [here](https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip) </br>
Extract the binary to /usr/bin and run </br>
  $ `/usr/bin/terraform init` </br>
     $ `/usr/bin/terraform plan ` </br>
     $ `/usr/bin/terraform apply` </br> at the root direcotry of project </br>

