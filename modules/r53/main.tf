resource "aws_route53_zone" "zone" {
  name = var.zone_name
}

resource "aws_route53_record" "records" {
  for_each = var.server_records

  zone_id = aws_route53_zone.zone.zone_id
  name    = each.key
  type    = "A"
  ttl     = 300
  records = [each.value]
}

