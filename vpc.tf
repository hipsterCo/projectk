resource "aws_vpc" "vpc" {
  cidr_block = "10.1.0.0/24"
  tags = {
    Name = "VPC"
  }
}

resource "aws_subnet" "pubsub1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.1.0.0/25"
  tags = {
    Name = "pubsub1"
  }

}

resource "aws_subnet" "pubsub2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.1.0.128/25"
  tags = {
    Name = "pubsub2"
  }

}

