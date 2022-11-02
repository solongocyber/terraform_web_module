module "vpc" {
    source = "/home/ec2-user/terraform_web_module/modules/vpc/vpc_v3"

env = "dev"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnet = ["public_subnet_1", "public_subnet_2", "public_subnet_3"]
private_subnet_cidr = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
cidr_block = "0.0.0.0/0"
private_subnet = ["private_subnet_1", "private_subnet_2", "private_subnet_3"]
az = ["us-east-2a", "us-east-2b", "us-east-2c"]
region = "us-east-2"
stage = "nonprod"
project = "project"


}

module "alb" {
    source = "/home/ec2-user/terraform_web_module/modules/alb/aws_alb_v2"
    vpc_id = module.vpc.vpc_id
    private_subnet = module.vpc.private_subnet[*]
    env = "dev"
    region = "us-east-2"
    
    
}

module "auto_scaling" {
  source = "/home/ec2-user/terraform_web_module/modules/asg_v3
}