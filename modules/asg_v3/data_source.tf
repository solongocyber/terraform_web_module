data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
data "template_file" "user_data" {
  template = file("/home/ec2-user/terraform_web_module/modules/asg_v3/user_data.sh")
  vars = {
    env = var.env
  }
}