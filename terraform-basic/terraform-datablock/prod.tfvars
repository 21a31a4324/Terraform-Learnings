web_security_group = {
  name = "web-sg"
  description = "Allowing SSH and HTTP"
  ingress_rules = {
    description = ["Allow-SSH","Allow-SSH"]
    ip_protocol=["tcp" ,"icmp"]
    from_port =[22 ,-1]
    to_port=[22,-1]
    cidr_ipv4=["0.0.0.0/0","0.0.0.0/0"]
  }
  egress_rules = {
    description = ["Allow all outbound" ,"allow few outbound"]
    ip_protocol=["-1" ,"tcp"]
    from_port=[null,443]
    to_port=[null,443]
    cidr_ipv4=["0.0.0.0/0","0.0.0.0/0"]
  }
}