variable "const_values" {
    description="giving internet through igw"
    type=object({
      NameVPC=string
      cidrVPC=string
      subnets=object({
        Namesubs = list(string)
        cidrsubs=list(string)
        az=list(string) 
      })
    })
    
}