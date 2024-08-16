# network config
data "aws_availability_zones" "available" {}

resource "aws_vpc" "clusterv2" {
  cidr_block = "10.31.0.0/16"
  tags = {
    Name = "cluster"
  }
}

resource "aws_subnet" "cluster-1" {
  count               = 2
  vpc_id              = aws_vpc.clusterv2.id
  cidr_block          = cidrsubnet(aws_vpc.clusterv2.cidr_block, 8, count.index)
  availability_zone   = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.clusterv2.id

  tags = {
    Name = "sockvshop"
  }
}

resource "aws_route_table" "route-cluster" {
  vpc_id = aws_vpc.clusterv2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "qa" {
  count                   =  2
  subnet_id               = aws_subnet.cluster-1[count.index].id
  route_table_id          = aws_route_table.route-cluster.id
}

