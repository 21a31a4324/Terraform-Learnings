resource "aws_vpc" "DevVpc" {
    cidr_block = var.needed_values.CidrVPC
    tags={
        Name=var.needed_values.NameVPC
    }
}
resource "aws_subnet" "subnets"{
    vpc_id=aws_vpc.DevVpc.id
    count=length(var.needed_values.subnets)
    cidr_block=var.needed_values.subnets.CidrSubs[count.index]
    availability_zone = var.needed_values.subnets.azSubs[count.index]
    tags={
        Name=var.needed_values.subnets.NameSubs[count.index]
    }
    depends_on = [ aws_vpc.DevVpc ]
}
resource "aws_internet_gateway" "igw"{
    vpc_id=aws_vpc.DevVpc.id
    tags={
        Name="Devigw"
    }
    depends_on = [ aws_vpc.DevVpc ]
}
resource "aws_route_table" "Devroute"{
    vpc_id = aws_vpc.DevVpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags={
        Name="Devroute"
    }
    depends_on = [ aws_vpc.DevVpc , aws_internet_gateway.igw ]
}
resource "aws_route_table_association" "subnetassociation"{
    count=length(var.needed_values.subnets)
    subnet_id = aws_subnet.subnets[count.index].id
    route_table_id = aws_route_table.Devroute.id
    depends_on = [ aws_subnet.subnets , aws_route_table.Devroute ]
}
resource "aws_security_group" "sg" {
    name = var.web_security_group.name
    vpc_id=aws_vpc.DevVpc.id
    description = var.web_security_group.description
    tags={
        Name=var.web_security_group.name
    }
    depends_on = [ aws_vpc.DevVpc ]
  
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
resource "aws_instance" "My_instance" {
    count=length(var.needed_values.subnets)
    ami="ami-0b32d400456908bf9"
    instance_type="t3.micro"
    key_name="Nandini"
    subnet_id=aws_subnet.subnets[count.index].id
    vpc_security_group_ids=[aws_security_group.sg.id]
    tags={
       Name ="Instance to manage peak usage"
  }
  depends_on = [ aws_vpc.DevVpc,
                 aws_subnet.subnets,
                 aws_internet_gateway.igw,
                 aws_route_table.Devroute,]
}