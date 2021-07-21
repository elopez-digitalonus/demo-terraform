resource "aws_kms_key" "kms_0545_key" {
  description = "KMS 0545 key"
  tags = {
    Alias = "0545_key"
  }
}


resource "aws_kms_alias" "kms_alias_0545" {
  name          = "alias/kms_alias_0545"
  target_key_id = aws_kms_key.kms_0545_key.key_id
}


resource "aws_vpc" "vpc_0545" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "vpc_0545"
  }
}


resource "aws_subnet" "subnet_0545_dmz" {
  vpc_id                  = aws_vpc.vpc_0545.id
  cidr_block              = var.vpc_cidr_dmz.subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = var.vpc_cidr_dmz.name
  }
}

resource "aws_subnet" "subnet_0545_core" {
  vpc_id                  = aws_vpc.vpc_0545.id
  cidr_block              = var.vpc_cidr_core.subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = var.vpc_cidr_core.name
  }
}


resource "aws_subnet" "subnet_0545_db" {
  vpc_id                  = aws_vpc.vpc_0545.id
  cidr_block              = var.vpc_cidr_db.subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = var.vpc_cidr_db.name
  }
}


resource "aws_network_acl" "vpc_0545_acl" {
  vpc_id     = aws_vpc.vpc_0545.id
  subnet_ids = [aws_subnet.subnet_0545_dmz.id, aws_subnet.subnet_0545_core.id, aws_subnet.subnet_0545_db.id]
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "vpc_0545_acl"
  }
}


resource "aws_internet_gateway" "gw_0545" {
  vpc_id = aws_vpc.vpc_0545.id
  tags = {
    Name = "gw_0545"
  }
}

resource "aws_route_table" "route_table_0545" {
  vpc_id = aws_vpc.vpc_0545.id
}


resource "aws_route" "route_internet_0545" {
  route_table_id         = aws_route_table.route_table_0545.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw_0545.id
}

resource "aws_route_table_association" "route_subnet_0545" {
  subnet_id      = aws_subnet.subnet_0545_dmz.id
  route_table_id = aws_route_table.route_table_0545.id
}


resource "aws_security_group" "sg_subnet_0545_dmz" {
  name        = "0545 sg dmz"
  description = "Allow resource access"
  vpc_id      = aws_vpc.vpc_0545.id

  dynamic "ingress" {
    for_each = var.ingress_dmz
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "0545 dmz"
  }
}
