# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = ""
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags = {
      Name = ""
    }      
}


# terraform.tf
/*terraform {
 backend "s3" {
  encrypt = true
  bucket = ""
  region = "us-east-1"
  key = "global/s3/terraform.tfstate" 
  }
} */


