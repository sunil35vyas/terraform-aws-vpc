
#Test Zone creation

resource "aws_route53_zone" "primary" {
  name = "example.com"
}


#A record for exisitng nginx

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.primary.id}"
  name    = "www.example.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.awstest-nat.id}"]
}