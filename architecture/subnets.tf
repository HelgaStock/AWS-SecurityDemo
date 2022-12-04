# subnets
resource "aws_subnet" "sub-private-1" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "sub-private-1"
  }
}

resource "aws_subnet" "sub-public-1" {
  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "sub-public-1"
  }
}
