data "aws_route53_zone" "this" {
  name = var.zone_name
}

resource "aws_route53_record" "servers" {
  for_each = var.server_records

  zone_id = data.aws_route53_zone.this.zone_id
  name    = each.key
  type    = "A"
  ttl     = 300
  records = [each.value]
}

