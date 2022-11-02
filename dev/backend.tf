terraform {
  backend "s3" {
    bucket = "aws-session-may2022-solongo"
    key    = "dev/modules/terraform.tfstate"
    region = "us-east-2"
  }
}