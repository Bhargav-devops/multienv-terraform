resource "aws_instance" "web" {
  #count = 11
  for_each = var.instance_name
  ami           = data.aws_ami.centos.id #devops-practice
  instance_type = each.value
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "www" {
  #count = 11
  for_each = aws_instance.web
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [startswith(each.key, "web") ? each.value.public_ip : each.value.private_ip]
}

# output foreach_info{
#   value = aws_instance.web
# }