# internet gateway
resource "aws_internet_gateway" "demo-igw" {
  vpc_id = aws_vpc.demovpc.id

  tags = {
    Name = "demo-igw"
  }
}