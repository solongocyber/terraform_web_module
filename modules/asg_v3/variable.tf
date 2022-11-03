variable "dev_instance_type" {
    type = string
    default = "t2.micro"
}

variable "prod_instance_type" {
    type = string
    default = "t3.micro"
}

variable "env" {
    type = string
    default = "dev"
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

variable "sg_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable  "ports" {
    type = list(string)
    default = [ "80" , "443"  ]
}

variable  "egress_port" {
    type = number
    default  = 0
}

variable "egress_protocol" {
type = number
default = "-1"
}

variable "max_size" {
    type = number
    default = "5"
}
variable "min_size" {
    type = number
    default = "2"
}
variable "desired_capacity" {
    type = number
    default = "2"
}

variable "instance_type"{
    type = string
    default = "t2.micro"
}

variable "public_subnet" {
    type = list(string)
}

variable "vpc_id" {
    type = string
    default = "vpc-0f467ff8dbe26fd17"
}

variable "alb_tg" {
    type = string
    default = "arn"
}

variable "ami" {
    type = string
    default = "ami-0f924dc71d44d23e2"
}

variable "sg_id"{
    type = string
    default = "sg_id"
}