resource "aws_vpc" "vpc-dion" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "terraform-101"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc-dion.id
  cidr_block = "10.0.0.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    "Name" = "terraform101-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc-dion.id
  cidr_block = "10.0.10.0/24"

  tags = {
    "Name" = "terraform101-private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-dion.id

  tags = {
    "Name" = "terraform101-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc-dion.id

  tags = {
    "Name" = "terraform101-rt-public"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc-dion.id

  tags = {
    "Name" = "terraform101-rt-private"
  }
}

resource "aws_route_table_association" "route_table_association_public" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "route_table_association_private" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route" "public_igw_rule" {
  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_vpc_endpoint" "terraform101-s3-endpoint" {
  vpc_id = aws_vpc.vpc-dion.id
  service_name = "com.amazonaws.ap-northeast-2.s3"

  tags = {
    Name = "terraform101-s3"
  }
}

resource "aws_vpc_endpoint_route_table_association" "s3-endpoint-rule" {
  route_table_id = aws_route_table.private_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.terraform101-s3-endpoint.id
}
