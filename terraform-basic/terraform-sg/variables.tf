variable "needed_values" {
    description="creating security group"
    type = object({
      NameVPC = string
      CidrVPC =string
      subnets=object({
         NameSubs = list(string)
         CidrSubs= list(string)
         azSubs =list(string)
      })
    })
}
variable "web_security_group"{
    type=object({
      name = string
      description=string
      ingress_rules=object({
        cidr_ipv4=list(string)
        description=list(string)
        from_port =list(number)
        to_port=list(number)
        ip_protocol=list(string)
      })
      egress_rules=object({
        cidr_ipv4 =list(string)
        description=list(string)
        from_port=list(number)
        to_port=list(number)
        ip_protocol=list(string)
      })
    })
}