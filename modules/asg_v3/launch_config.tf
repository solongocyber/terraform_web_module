resource "aws_launch_configuration" "launch_conf_v3" {
  name_prefix   = replace(local.name, "rtype" , "lc_v3")
  image_id      = var.ami
  instance_type = var.env == "dev" ? var.dev_instance_type : var.prod_instance_type
  key_name = aws_key_pair.public_key1.key_name
  user_data       = data.template_file.user_data.rendered
  security_groups = [var.sg_id]

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_key_pair" "public_key1" {
  key_name   = "terraform_key1"
  public_key = file("~/.ssh/id_rsa.pub")

}