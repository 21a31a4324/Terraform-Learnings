data "aws_vpc" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

data "aws_subnets" "defaultsubs" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_security_group" "sg" {
    name = var.web_security_group.name
    vpc_id=data.aws_vpc.default.id
    description = var.web_security_group.description
    tags={
        Name=var.web_security_group.name
    }
    depends_on = [ data.aws_vpc.default ]
  
}
resource "aws_vpc_security_group_ingress_rule" "sg"{
    count=length(var.web_security_group.ingress_rules.ip_protocol)
    security_group_id = aws_security_group.sg.id
    ip_protocol = var.web_security_group.ingress_rules.ip_protocol[count.index]
    from_port = var.web_security_group.ingress_rules.from_port[count.index]
    cidr_ipv4 = var.web_security_group.ingress_rules.cidr_ipv4[count.index]
    to_port = var.web_security_group.ingress_rules.to_port[count.index]
    description = var.web_security_group.ingress_rules.description[count.index]
    depends_on = [ aws_security_group.sg ]

}
resource "aws_vpc_security_group_egress_rule" "sg" {
    count=length(var.web_security_group.egress_rules.ip_protocol)
    security_group_id = aws_security_group.sg.id
    ip_protocol = var.web_security_group.egress_rules.ip_protocol[count.index]
    from_port =var.web_security_group.egress_rules.from_port[count.index]
    cidr_ipv4 = var.web_security_group.egress_rules.cidr_ipv4[count.index]
    to_port=var.web_security_group.egress_rules.to_port[count.index]
    description = var.web_security_group.egress_rules.description[count.index]
    depends_on=[aws_security_group.sg]
  
}

/*data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ami-08a6efd148b1f7504"]
  }
}*/
data "aws_ami" "ubuntu_jammy" {
  most_recent = true
  owners      = ["099720109477"] 
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250627"]
    //ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250516
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "My_instance" {
    ami=data.aws_ami.ubuntu_jammy.id
    instance_type="t3.micro"
    key_name="Nandini"
    subnet_id=data.aws_subnets.defaultsubs.ids[0]
    vpc_security_group_ids=[aws_security_group.sg.id]
    tags={
       Name ="Instance to manage peak usage"
  }
}