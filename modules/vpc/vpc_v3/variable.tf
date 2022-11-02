variable "vpc_cidr"{
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr"{
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


variable "private_subnet_cidr"{
    type = list(string)
    default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

}

variable "cidr_block" {
    type = string
    default = "0.0.0.0/0"
}


variable "public_rt" {
    type = string
    default = "public_rt"
}

variable "private_rt" {
    type = string
    default = "private_rt"
}

variable "az" {
    type = list(string)
    default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "env" {
    type = string
    default = "dev"
}

variable "project" {
    type = string
    default = "project"
}

variable "team" {
    type = string
    default = "DevOps"
}

variable "owner" {
    type = string
    default = "Solongo"
}

variable "region" {
    type = string
    default = "us-east-2"
}

variable "stage" {
    type = string
    default = "nonprod"
}