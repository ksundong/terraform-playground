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
