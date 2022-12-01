resource "aws_instance" "demo-instance1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "demo-instance1"
    monitoring = true
  }
}

resource "aws_instance" "demo-instance2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "demo-instance2"
  }
}