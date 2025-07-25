const_values={
        NameVPC = "DeveloperVPC"
        cidrVPC = "10.0.0.0/16"
        subnets = {
          Namesubs = [ "publicsubnet-1","publicsubnet-2","privatesubnet-1","privatesubnet-2" ]
          cidrsubs=["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
          az=["ap-south-1a","ap-south-1b","ap-south-1c","ap-south-1a"]
        }
    }