terraform {
  backend "s3" {
    bucket = "aws-session-may2022-solongo"
    key    = "qa/modules/terraform.tfstate"
    region = "us-east-2"
  }
}