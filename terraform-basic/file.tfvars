network_values={
    Namevpc = "dummyvpc"
    cidrvpc="192.168.0.0/16"
    subnets = [{
        cidrsubs=  ["192.168.0.0/24","192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24","192.168.5.0/24"]
        az= ["ap-south-1a","ap-south-1b","ap-south-1c","ap-south-1a", "ap-south-1b","ap-south-1c"]
        Namesub = ["web","prod","app","db","release","test"]
    }
    ]
}