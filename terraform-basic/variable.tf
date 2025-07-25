variable "cidrblockvpc" {
    type = string
    default="10.0.0.0/16"
}
variable "vpcname1"{
    type = string
    default="myfirstvpc"
}
variable "subnet1name" {
    type = string
    default="sub1"
}
variable "subnet1cidr" {
    type =string
    default="10.0.0.0/24"
}
variable "subnet1az" {
    type =string
    default ="ap-south-1a"
}
variable "subnet2name" {
    type = string
    default="sub2"
}
variable "subnet2cidr" {
    type =string
    default="10.0.1.0/24"
}
variable "subnet2az" {
    type =string
    default ="ap-south-1b"
}
variable "subnet3name" {
    type = string
    default="sub3"
}
variable "subnet3cidr" {
    type =string
    default="10.0.2.0/24"
}
variable "subnet3az" {
    type =string
    default ="ap-south-1c"
}
variable "subnet4name" {
    type = string
    default="sub4"
}
variable "subnet4cidr" {
    type =string
    default="10.0.3.0/24"
}
variable "subnet4az" {
    type =string
    default ="ap-south-1a"
}
variable "myvpcseccidr" {
    type=string
    default="192.168.0.0/16"
}
variable "myvpcsecname" {
    type=string
    default = "2vpc"
}
variable "secsubonecidr"{
    type = string
    default ="192.168.0.0/24"
}
variable "secsuboneaz" {
    type =string
    default="us-west-1a"
}
variable "secsubonename" {
    type =string
    default = "sub2-1"
}
variable "secsubseccidr"{
    type = string
    default ="192.168.1.0/24"
}
variable "secsubsecaz" {
    type =string
    default="us-west-1a"
}
variable "secsubsecname" {
    type =string
    default = "sub2-2"
}
variable "secsubthircidr"{
    type = string
    default ="192.168.2.0/24"
}
variable "secsubthiraz" {
    type =string
    default="us-west-1c"
}
variable "secsubthirname" {
    type =string
    default = "sub2-3"
}
variable "secsubfoucidr"{
    type = string
    default ="192.168.3.0/24"
}
variable "secsubfouaz" {
    type =string
    default="us-west-1c"
}
variable "secsubfouname" {
    type =string
    default = "sub2-4"
}

