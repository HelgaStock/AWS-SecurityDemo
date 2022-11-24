# route table
resource "aws_route_table" "demo-rt" {
  vpc_id = aws_vpc.demovpc.id

# route 1
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.demo-igw.id
  }

  tags = {
    Name = "demo-rt"
  }
}
#route table association 1
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub-public-1.id
  route_table_id = aws_route_table.demo-rt.id
}
#route table association 2
resource "aws_route_table_association" "b" {
  gateway_id     = aws_internet_gateway.demo-igw.id
  route_table_id = aws_route_table.demo-rt.id
}