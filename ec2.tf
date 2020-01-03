
resource "aws_launch_template" "nginx-test" {
  name_prefix   = "nginx-test"
  image_id      = "ami-06d51e91cea0dac8d"
  instance_type = "t2.micro"
  user_data = "${file("userdata.sh")}"

  vpc_security_group_ids = [
    "${aws_security_group.http-group.id}",
    "${aws_security_group.all-outbound-traffic.id}",
  ]

}

resource "aws_autoscaling_group" "scale" {
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2
  vpc_zone_identifier = ["${aws_subnet.awstest-private-1.id}", "${aws_subnet.awstest-private-2.id}"]
  launch_template {
    id      = "${aws_launch_template.nginx-test.id}"
    version = "$Latest"

  }
}

