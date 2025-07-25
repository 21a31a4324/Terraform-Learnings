resource "aws_vpc" "dummyvpc"{
    cidr_block=var.network_values.cidrvpc
    tags={
        Name=var.network_values.Namevpc
    }
}
resource "aws_subnet" "my6subnets"{
    count=length(var.network_values.subnets)
    vpc_id = aws_vpc.dummyvpc.id
    availability_zone = var.network_values.subnets.az[count.index]
    cidr_block =var.network_values.subnets.cidrsubs[count.index]
    tags={
        Name = var.network_values.subnets.Namesub[count.index]
    }
} 