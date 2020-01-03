

# aws test VPC
resource "aws_vpc" "awstest" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = false
  tags {
    Name = "awstest"
  }
}


# aws test Subnets
resource "aws_subnet" "awstest-public-1" {
  vpc_id = "${aws_vpc.awstest.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2a"

 }
resource "aws_subnet" "awstest-public-2" {
  vpc_id = "${aws_vpc.awstest.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2b"

}


resource "aws_subnet" "awstest-public-3" {
  vpc_id = "${aws_vpc.awstest.id}"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2c"

}

resource "aws_subnet" "awstest-private-1" {
  vpc_id = "${aws_vpc.awstest.id}"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2a"

}
resource "aws_subnet" "awstest-private-2" {
  vpc_id = "${aws_vpc.awstest.id}"
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2b"

}

resource "aws_subnet" "awstest-private-3" {
  vpc_id = "${aws_vpc.awstest.id}"
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2c"

}






# aws test GW
resource "aws_internet_gateway" "awstest-gw" {
  vpc_id = "${aws_vpc.awstest.id}"

}

# aws test RT
resource "aws_route_table" "awstest-public" {
  vpc_id = "${aws_vpc.awstest.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.awstest-gw.id}"
  }

  tags {
    Name = "awstest-public-1"
  }
}

# aws test RTA
resource "aws_route_table_association" "awstest-public-1-a" {
  subnet_id = "${aws_subnet.awstest-public-1.id}"
  route_table_id = "${aws_route_table.awstest-public.id}"
}
resource "aws_route_table_association" "awstest-public-2-a" {
  subnet_id = "${aws_subnet.awstest-public-2.id}"
  route_table_id = "${aws_route_table.awstest-public.id}"
}

resource "aws_route_table_association" "awstest-public-3-a" {
  subnet_id = "${aws_subnet.awstest-public-3.id}"
  route_table_id = "${aws_route_table.awstest-public.id}"
}

# For NAT Gateway
resource "aws_eip" "awstest-nat" {
  vpc      = true
}
resource "aws_nat_gateway" "awstest-nat-gw" {
  allocation_id = "${aws_eip.awstest-nat.id}"
  subnet_id = "${aws_subnet.awstest-public-1.id}"
  depends_on = ["aws_internet_gateway.awstest-gw"]
}

# VPC for NAT
resource "aws_route_table" "awstest-private" {
  vpc_id = "${aws_vpc.awstest.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.awstest-nat-gw.id}"
  }

  tags {
    Name = "awstest-private-1"
  }
}
# vpc private routes
resource "aws_route_table_association" "awstest-private-1-a" {
  subnet_id = "${aws_subnet.awstest-private-1.id}"
  route_table_id = "${aws_route_table.awstest-private.id}"
}
resource "aws_route_table_association" "awstest-private-2-a" {
  subnet_id = "${aws_subnet.awstest-private-2.id}"
  route_table_id = "${aws_route_table.awstest-private.id}"
}

resource "aws_route_table_association" "awstest-private-3-a" {
  subnet_id = "${aws_subnet.awstest-private-3.id}"
  route_table_id = "${aws_route_table.awstest-private.id}"
}