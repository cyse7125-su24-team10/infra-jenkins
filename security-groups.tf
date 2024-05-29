#Security group 

resource "aws_security_group" "jenkins_sg" {
  name = var.jenkins_security_group_name
  description = var.jenkins_security_group_description
  vpc_id = aws_vpc.jenkins_vpc.id


# Opening for now to use lets encrypt staging environment 
  ingress {
    from_port = var.port_http
    to_port = var.port_http
    protocol = var.ingress_protocol
    cidr_blocks = var.ingress_protocol_cidr_block
  }

  ingress {
    from_port = var.port_ssl
    to_port = var.port_ssl
    protocol = var.ingress_protocol
    cidr_blocks = var.ingress_protocol_cidr_block 
  }
}
