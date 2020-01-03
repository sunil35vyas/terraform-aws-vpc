resource "aws_security_group" "http-group" {
  name = "http-access-group"
  description = "Allow traffic on port 80 (HTTP)"

  tags = {
    Name = "HTTP Inbound Traffic Security Group"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "aws_security_group" "all-outbound-traffic" {
  name = "all-outbound-traffic-group"
  description = "Allow traffic to leave the AWS instance"

  tags = {
    Name = "Outbound Traffic Security Group"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}
