variable provider_region {}
variable jenkins_vpc_cidr_block  {}
variable jenkins_vpc_tag_name {}
variable jenkins_public_subnet_cidr_block {}
variable jenkins_public_subnet_availability_zone {}
variable jenkins_public_subnet_tag {}
variable route_table_cidr_block {}
variable jenkins_security_group_name {}
variable jenkins_security_group_description {}
variable ingress_protocol {}
variable ingress_protocol_cidr_block {
    type = list(string)
}
variable egress_protocol_cidr_block {
    type = list(string)
}
variable egress_protocol {}
variable port_http {}
variable port_ssl {}
variable ami_jenkins {}
variable ec2_instance_type {}
variable egress_from_port {}
variable egress_to_port {}
variable jenkins_elastic_ip {
    type = list(string)
}
variable jenkins_eip_name {}
variable ec2_instance_tagname {}
