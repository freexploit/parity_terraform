
provider "aws" {
  version = "~> 2.0"
  profile = "upway"
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_s3_state" {
  bucket ="radar-parity-state"

  versioning {
    enabled=true
  }

  tags = {
    Name = "Terraform State"
  }
  
}

resource "aws_s3_bucket_policy" "radar-new-policy" {
  bucket = aws_s3_bucket.terraform_s3_state.id

  policy = <<POLICY
{
  "Id": "Policy1580656011346",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1580654791909",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::radar-parity-terraform-state/*",
      "Principal": {
        "AWS": [
          "arn:aws:iam::646698552641:user/cvalerio"
        ]
      }
    },
    {
      "Sid": "Stmt1580656010020",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::radar-parity-state",
      "Principal": {
        "AWS": [
          "arn:aws:iam::646698552641:user/cvalerio"
        ]
      }
    }
  ]
}
POLICY
  
}

resource "aws_dynamodb_table" "terraform_state_locking_dynamodb" {
  name = "terraform-state-locking"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags = {
    Name = "Terraform State File Locking"
  }
}
