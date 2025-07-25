needed_values = {
  NameVPC="DevVPC"
  CidrVPC = "10.0.0.0/16"
  subnets={
    NameSubs=["dev","release","prod"]
    CidrSubs=["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
    azSubs=["ap-south-1a","ap-south-1b","ap-south-1c"]
  }
}
web_security_group = {
  name = "web-sg"
  description = "Allowing SSH and HTTP"
  ingress_rules = {
    description = ["Allow-SSH","Allow-SSH"]
    ip_protocol=["tcp" ,"icmp"]
    from_port =[22 ,80]
    to_port=[22,80]
    cidr_ipv4=["0.0.0.0/0","0.0.0.0/0"]
  }
  egress_rules = {
    description = ["Allow all outbound" ,"allow few outbound"]
    ip_protocol=["-1" ,"tcp"]
    from_port=[0,443]
    to_port=[0,443]
    cidr_ipv4=["0.0.0.0/0","0.0.0.0/0"]
  }
}