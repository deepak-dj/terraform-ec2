terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "5.59.0" 
		}
	}

	backend "s3" {
   		bucket         = "terra-remote-bucket"
    		key            = "terraform.tfstate"
    		region         = "eu-north-1"
    		dynamodb_table = "terra-remote-table"
  	}
}
