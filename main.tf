#provider AWS and choose Region and admin user access key
provider "aws" {      
  region = "ap-northeast-1"
}

variable "vpc-cidr_block" {
  description = "vpc cidr block"
}

variable "subnet-1-cidr_block" {
  description = "subnet-1 cidr block"
}

variable "subnet-2-cidr_block" {
  description = "subnet-2 cidr block"
}

#Create VPC and main subnet
resource "aws_vpc" "nitrobug-vpc" {                                   
  cidr_block = var.vpc-cidr_block 
  tags = {                            #Define Name
    Name: "nitrobug-vpc"
  }
}

#Create Subnet with each AZ
resource "aws_subnet" "nitrobug-subnet-1" {                           
  vpc_id = aws_vpc.nitrobug-vpc.id            #let define AWS id itself
  cidr_block = var.subnet-1-cidr_block
  availability_zone = "ap-northeast-1a"  
  tags = {
    Name: "nitrobug-subnet-1"
  }
}

resource "aws_subnet" "nitrobug-subnet-2" {
  vpc_id = aws_vpc.nitrobug-vpc.id
  cidr_block = var.subnet-2-cidr_block
  availability_zone = "ap-northeast-1c"
  tags = {
    Name: "nitrobug-subnet-2"
  }
}
output "nitrobug-vpc-id" {                    #get output in cmd
  value = aws_vpc.nitrobug-vpc.id
}

output "nitrobug-subnet-1-id" {
  value = aws_subnet.nitrobug-subnet-1.id
}