variable "vpc_id" {
    type = string
    default = "vpc-0de4a86ead40d6439"
}

variable "ingress_rule" {
    type = list(string)
    default = ["22", "80" , "443" ]
}

variable "egress_rule"{
    type = number
    default = 0
}

variable "egress_protocol" {
    type = string
    default = "-1"

}

variable "cidr_block" {
    type = string
    default = "0.0.0.0/0"
}

variable "env" {
    type = string
    default = "dev"
}