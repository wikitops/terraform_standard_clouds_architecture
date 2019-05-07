
resource "aws_vpc" "this" {
  cidr_block                  = "${var.aws_vpc_cidr_block}"

  enable_dns_support          = true
  enable_dns_hostnames        = true

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}"))}"
}


resource "aws_eip" "this" {
  count                       = "${length(var.aws_cidr_subnets_public)}"
  vpc                         = true
}


resource "aws_internet_gateway" "this" {
  vpc_id                      = "${aws_vpc.this.id}"

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}"))}"
}

resource "aws_subnet" "this-public" {
  vpc_id                      = "${aws_vpc.this.id}"
  count                       = "${length(var.aws_avail_zones)}"
  availability_zone           = "${element(var.aws_avail_zones, count.index)}"
  cidr_block                  = "${element(var.aws_cidr_subnets_public, count.index)}"
  map_public_ip_on_launch     = true
  depends_on                  = ["aws_internet_gateway.this"]

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}-${element(var.aws_avail_zones, count.index)}-public"))}"
}

resource "aws_nat_gateway" "this" {
  count                       = "${length(var.aws_cidr_subnets_public)}"
  allocation_id               = "${element(aws_eip.this.*.id, count.index)}"
  subnet_id                   = "${element(aws_subnet.this-public.*.id, count.index)}"
}

resource "aws_subnet" "this-private" {
  vpc_id                      = "${aws_vpc.this.id}"
  count                       = "${length(var.aws_avail_zones)}"
  availability_zone           = "${element(var.aws_avail_zones, count.index)}"
  cidr_block                  = "${element(var.aws_cidr_subnets_private, count.index)}"

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}-${element(var.aws_avail_zones, count.index)}-private"))}"
}

resource "aws_route_table" "this-public" {
  vpc_id                      = "${aws_vpc.this.id}"
  route {
    cidr_block                = "0.0.0.0/0"
    gateway_id                = "${aws_internet_gateway.this.id}"
  }

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}-routetable-public"))}"
}

resource "aws_route_table" "this-private" {
  count                       = "${length(var.aws_cidr_subnets_private)}"
  vpc_id                      = "${aws_vpc.this.id}"
  route {
    cidr_block                = "0.0.0.0/0"
    nat_gateway_id            = "${element(aws_nat_gateway.this.*.id, count.index)}"
  }

  tags                        = "${merge(var.default_tags, map("Name", "${var.aws_cluster_name}-routetable-private-${count.index}"))}"
}

resource "aws_route_table_association" "this-public" {
  count                       = "${length(var.aws_cidr_subnets_public)}"
  subnet_id                   = "${element(aws_subnet.this-public.*.id,count.index)}"
  route_table_id              = "${aws_route_table.this-public.id}"
}

resource "aws_route_table_association" "this-private" {
  count                       = "${length(var.aws_cidr_subnets_private)}"
  subnet_id                   = "${element(aws_subnet.this-private.*.id,count.index)}"
  route_table_id              = "${element(aws_route_table.this-private.*.id,count.index)}"
}
