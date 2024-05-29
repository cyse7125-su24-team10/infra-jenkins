# infra-jenkins

## Introduction
IaaC Terraform AWS Infrastructure.

The Terraform configuration sets up an AWS EC2 instance for a Jenkins server, specifying details like AMI, instance type, and user data to use Certbot on the instance AMI for installing a certificate. It creates a VPC, public subnet, and an Internet gateway, along with associating an Elastic IP to the Jenkins instance. Security groups are defined to allow HTTP and HTTPS traffic, and the necessary route table and associations are configured for the public subnet.

## Prerequisites.
- [Terraform](https://www.terraform.io/) installed on your machine
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed on your machine

## Setup Instructions
Instructions for setting up the infrastructure using Terraform.

1. **Clone the Repository:**
    ```bash
    git clone git@github.com:cyse7125-su24-team10/infra-jenkins.git
    cd infra-jenkins
    ```
2. **Add terraform.tfvars file: Example below**
    ```hcl
    ami_jenkins = "ami-***********" # ami id from aws console
    jenkins_vpc_cidr_block = "10.0.0.0/16"
    jenkins_vpc_tag_name = "jenkins-vpc"
    jenkins_public_subnet_cidr_block = "10.0.1.0/24"
    jenkins_public_subnet_availability_zone = "us-east-1a"
    jenkins_public_subnet_tag = "jenkins-public-subnet"
    route_table_cidr_block = "0.0.0.0/0"
    jenkins_security_group_name = "jenkins-security-group"
    jenkins_security_group_description =  "Security group for Jenkins EC2 instance"
    provider_region = "us-east-1"
    ingress_protocol = "tcp"
    port_http = 80
    port_ssl = 443
    ingress_protocol_cidr_block = ["0.0.0.0/0"]
    egress_protocol_cidr_block = ["0.0.0.0/0"]
    egress_from_port = 0
    egress_to_port = 0
    ec2_instance_type = "t2.micro" 
    jenkins_eip_name = "tag:Name"
    jenkins_elastic_ip = ["jenkins-instance-elastic-ip"]
    ec2_instance_tagname = "team10-jenkins"
    egress_protocol = "-1"

3. **Setup aws profile on cli**
    ```bash
    export AWS_PROFILE=dev
    ```

4. **Initialize Terraform:**
    ```bash
    terraform init
    ```

5. **Terraform Configuration:**
   Review the `terraform.tfvars`. Modify variables in `terraform.tfvars` as needed for your environment.

6. **Plan Infrastructure Changes:**
    ```bash
    terraform plan
    ```

6. **Apply Infrastructure Changes:**
    ```bash
    terraform apply
    ```

7. **Verify the Infrastructure:**
   After Terraform applies the changes successfully, verify the infrastructure on GCP.

## Cleaning Up
Instructions for tearing down the infrastructure

1. **Destroy Infrastructure:**
    ```bash
    terraform destroy
    ```

2. **Confirm Destruction:**
   Terraform will prompt you to confirm destruction. Enter `yes` to proceed with tearing down the infrastructure.
