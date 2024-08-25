variable instance_name{
    type = map 
    default = {
        mongodb = "t3.small"
        redis = "t2.micro"
        shipping = "t3.small"
    }
}

variable zone_id{
    default = "Z0390089TIO0SFJPINO3"
}

variable domain_name {
    default = "bhargavdevops.online"
}