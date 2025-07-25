resource "aws_vpc" "DeveloperVPC"{
    cidr_block = var.const_values.cidrVPC
    tags={
        Name=var.const_values.NameVPC
    }
}
resource "aws_subnet" "DeveloperSubnets"{
    vpc_id = aws_vpc.DeveloperVPC.id
    count=local.subnets_values ? length(var.const_values.subnets) : null
    cidr_block = var.const_values.subnets.cidrsubs[count.index]
    availability_zone=var.const_values.subnets.az[count.index]
    tags={
        Name=var.const_values.subnets.Namesubs[count.index]
    }
    depends_on = [ aws_vpc.DeveloperVPC ]
}
resource "aws_internet_gateway" "gw" {
    vpc_id=aws_vpc.DeveloperVPC.id
    tags={
        Name="DeveloperIGW"
    }
    depends_on = [ aws_vpc.DeveloperVPC ]
}
resource "aws_route_table" "table"{
    vpc_id = aws_vpc.DeveloperVPC.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags={
        Name="DeveloperRoute"
    }
    depends_on = [ aws_vpc.DeveloperVPC,aws_subnet.DeveloperSubnets,aws_internet_gateway.gw ]
}
#associate route table with public subnet --- subnet association

resource "aws_route_table_association" "assoc"{
    count=local.subnets_values ? 1: null
    subnet_id = aws_subnet.DeveloperSubnets[count.index].id
    route_table_id = aws_route_table.table.id
    depends_on = [ aws_internet_gateway.gw,aws_route_table.table, aws_subnet.DeveloperSubnets]
}