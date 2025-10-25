terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "url-shortener/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
