variable "env" {
    type = string
    default = "dev"
}

variable "vpc_id" {
    type = string
    description = "custom vpc id"
}

variable "public_subnet" {
    type = list(string)
    description = "public subnet id from vpc output"
}


variable "region" {
    type = string
    default = "us-east-2"
}

variable  "stage" {
    type = string
    default = "nonprod"
}

variable  "project" {
    type = string
    default = "cat"
}

variable "alb_tg_port" {
    type = string
    default = "80"

}

variable  "ports" {
    type = list(string)
    default = [ "80" , "443" ,"22" ]
}

variable  "egress_port" {
    type = number
    default  = 0
}

variable "egress_protocol" {
type = number
default = "-1"
}

variable "sg_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "internal" {
    type = bool
    default = false
}

variable "lb_type" {
    type = string
    default = "application"
}
variable "alb_tg" {
    type = string
    default = "arn"
}