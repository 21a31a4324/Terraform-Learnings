resource "aws_vpc" "myvpc" {
    cidr_block= var.cidrblockvpc
    instance_tenancy = "default"
    tags={
       Name=var.vpcname1
    }
  }
resource "aws_subnet" "firstsubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet1cidr
    availability_zone = var.subnet1az
    tags={
        Name=var.subnet1name
    }
}
resource "aws_subnet" "secondsub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet2cidr
    availability_zone = var.subnet2az
    tags={
        Name= var.subnet2name
    }
}
resource "aws_subnet" "thirdsub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet3cidr
    availability_zone = var.subnet3az
    tags={
        Name=var.subnet3name
    }
}
resource "aws_subnet" "fourthsub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet4cidr
    availability_zone = var.subnet4az
    tags={
        Name= var.subnet4name
    }
}
 resource "aws_vpc" "mysecvpc" {
    provider = aws.usw
    cidr_block= var.myvpcseccidr
    instance_tenancy = "default"
    tags={
        Name= var.myvpcsecname
    }
  }
  resource "aws_subnet" "sec-onesub" {
     provider=aws.usw
    vpc_id=aws_vpc.mysecvpc.id
    cidr_block = var.secsubonecidr
    availability_zone = var.secsuboneaz
    tags={
        Name = var.secsubonename
    }
  
}
resource "aws_subnet" "sec-secsub" { 
     provider=aws.usw
    vpc_id=aws_vpc.mysecvpc.id
    cidr_block = var.secsubseccidr
    availability_zone = var.secsubsecaz
    tags={
        Name = var.secsubsecname
    }
  
}
resource "aws_subnet" "sec-thirsub" {
     provider=aws.usw
    vpc_id=aws_vpc.mysecvpc.id
    cidr_block = var.secsubthircidr
    availability_zone = var.secsubthiraz
    tags={
        Name = var.secsubthirname
    }
  
}
resource "aws_subnet" "sec-fousub" {
     provider=aws.usw
    vpc_id=aws_vpc.mysecvpc.id
    cidr_block = var.secsubfoucidr
    availability_zone = var.secsubfouaz
    tags={
        Name = var.secsubfouname
    }
  
}