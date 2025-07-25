variable "network_values" {
    description = "this vpc and subnet values"
    type=object({
      Namevpc= string
      cidrvpc = string
      subnets=object({
        Namesub=list(string)
        az=list(string)
        cidrsubs=list(string)
      })
    })
 
    }
