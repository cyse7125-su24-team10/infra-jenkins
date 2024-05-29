# Data source to reference the Elastic IP allocation
data "aws_eip" "jenkins_eip" {
  filter {
    name = var.jenkins_eip_name
    values = var.jenkins_elastic_ip
  }
}