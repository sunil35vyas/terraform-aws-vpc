#  Getting Started - Terraform For aws-vpc 
This terraform  will create
1. One VPC ( 3 Public & private subnet, NAT gateway and Internet Gateway)
2. Two ubuntu instances, and install nginx on them using userdata.sh 
3. Autoscaling for instance upto 4 
4. Security group for exposing port 80 and allow all outgoing traffic
5. Route 53 A Record pointing to the NAT gateway of VPC

# Installation
Make sure you have updated the provider detail in provider.tf .
The version 0.12.X of terraform is installed </br>
Or download linux  [binary for terraform here](https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip) </br>
Extract the binary to /usr/bin and run </br>
```sh
     $ /usr/bin/terraform init 
     $ /usr/bin/terraform plan 
     $ /usr/bin/terraform apply 
     
 ```
 at the root direcotry of project. </br>
 
 ## Future Scope
     
We can use Terraform registry which creates resources on AWS with predefined modules. but for more flexibility we should consider creation of reusable module for frequent resources. 

In house module will give you freedom to use specific resources and integration to deploy ansible and project based user_data role. 

### Flow Chart For Modularized Infrastructure 

![Modularized Flow ](https://github.com/sunil35vyas/terraform-aws-vpc/blob/master/modularized_flow.jpeg)
