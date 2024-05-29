#Creating Jenkins VPC
resource "aws_vpc" "jenkins_vpc" {
  cidr_block       = var.jenkins_vpc_cidr_block
  tags = {
    Name = var.jenkins_vpc_tag_name
  }
}

#Public subnet for the jenkins vpc
resource "aws_subnet" "jenkins_public_subnet" {
  vpc_id            = aws_vpc.jenkins_vpc.id
  cidr_block         = var.jenkins_public_subnet_cidr_block
  availability_zone = var.jenkins_public_subnet_availability_zone
  tags = {
    Name = var.jenkins_public_subnet_tag
  }
}

# Internet gateway for the vpc
resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id
}

#Route table 
resource "aws_route_table" "jenkins_public_route_table" {
  vpc_id = aws_vpc.jenkins_vpc.id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.jenkins_igw.id
  }
}

#jenkins public subnet and route table association 
resource "aws_route_table_association" "jenkins_public_subnet_association" {
  subnet_id         = aws_subnet.jenkins_public_subnet.id
  route_table_id     = aws_route_table.jenkins_public_route_table.id
}
