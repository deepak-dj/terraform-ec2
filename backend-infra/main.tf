resource "aws_s3_bucket" "terra-remote-bucket" {
	bucket = "terra-remote-bucket"
}

resource "aws_dynamodb_table" "terra-remote-table" {
	name = "terra-remote-table"
	billing_mode   = "PAY_PER_REQUEST"
	hash_key       = "LockID"
	attribute {
  	  name = "LockID"
   	  type = "S"
  	}
	tags = {
   	  Name = "terra-remote-table"
  	}
}
