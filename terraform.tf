# /**********************************************************************
#  File:        terraform.tf
#  Description: Service definitions

# ***********************************************************************/

# provider "aws" {
#   region  = "eu-central-1"
# }

# resource "aws_s3_bucket" "tf_course" {
#     bucket = "examplestate11"
# }

# terraform {
#   backend "s3" {
#     encrypt = true 
#     bucket = "examplestate11"
#     dynamodb_table = "terraform-state-lock"
#     key    = "terraform.tfstate"
#     region = "eu-central-1"
#   }
# }

# resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
#   name = "terraform-state-lock"
#   hash_key = "LockID"
#   read_capacity = 20
#   write_capacity = 20

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }