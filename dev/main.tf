module "vpc" {
    source = "/home/ec2-user/terraform_web_module/modules/vpc"

env = "dev"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
cidr_block = "0.0.0.0/0"
az = ["us-east-2a", "us-east-2b", "us-east-2c"]
region = "us-east-2"
stage = "nonprod"
project = "project"


}

module "alb" {
    source = "/home/ec2-user/terraform_web_module/modules/alb"
    vpc_id = module.vpc.vpc_id
    public_subnet = module.vpc.public_subnet[*]
    env = "dev"
    region = "us-east-2"
    
    
}

module "auto_scaling" {
  source = "/home/ec2-user/terraform_web_module/modules/asg_v3"
  alb_tg = module.alb.alb_tg
  vpc_id = module.vpc.vpc_id
  ami = "ami-0f924dc71d44d23e2"
  public_subnet = module.vpc.public_subnet[*]
  sg_id = module.security_group.sg_id
}

module "security_group" {
  source = "/home/ec2-user/terraform_web_module/modules/security_group"
  vpc_id = module.vpc.vpc_id
}
