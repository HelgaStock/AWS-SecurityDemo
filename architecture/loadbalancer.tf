
resource "aws_lb" "security_demo_lb" {
  name               = "security-demo-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_lb.id]
  subnets            = [aws_subnet.sub-public-1.id, aws_subnet.sub-private-1.id]

}

resource "aws_lb_listener" "demo_listener" {
  load_balancer_arn = aws_lb.security_demo_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo_target.arn
  }
}

resource "aws_lb_target_group" "demo_target" {
  name     = "demo-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo-vpc.id
}

output "load_balancer_dns" {
  value       = aws_lb.security_demo_lb.dns_name
  description = "Dns name of lb"
}