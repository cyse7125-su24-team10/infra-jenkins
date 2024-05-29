# ec2 jenkins instance 
resource "aws_instance" "jenkins_server" {
  ami           =  var.ami_jenkins
  instance_type = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  subnet_id = aws_subnet.jenkins_public_subnet.id
  associate_public_ip_address = true
  user_data = <<-EOF
    #!/bin/bash
    sudo certbot --nginx -d jenkins.skynetx.me --agree-tos --register-unsafely-without-email --noninteractive --test-cert
    EOF
  tags= {
    Name=var.ec2_instance_tagname 
  }
}

