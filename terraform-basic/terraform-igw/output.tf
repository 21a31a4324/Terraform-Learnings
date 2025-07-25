output "vpcid" {
    value=aws_vpc.DeveloperVPC.id
}
output "subids" {
    value=aws_subnet.DeveloperSubnets[*].id
}
output "igwid" {
    value=aws_internet_gateway.gw.id
}
output "routetableid"{
    value =aws_route_table.table.id
}