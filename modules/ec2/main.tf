resource "aws_security_group" "instance_sg" {
  name   = "${var.environment}-instances-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.environment}-instances-sg" }
}

resource "aws_instance" "server" {
  for_each = var.servers

  ami           = each.value.ami_id
  instance_type = each.value.instance_type
  key_name      = each.value.key_name

  subnet_id = each.value.subnet_id != "" ? each.value.subnet_id : element(var.private_subnets, 0)

  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  user_data = <<-EOF
  #!/bin/bash
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>This is Terraform Project - ${each.value.name} (${var.environment})</h1>" > /var/www/html/index.html
EOF

  tags = {
    Name        = each.value.name
    Environment = var.environment
  }
}
