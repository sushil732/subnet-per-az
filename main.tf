variable "cidr"  {
  default = "10.0.0.0/16"
}

variable "region" {
    description = "Enter the region"
}

variable "vpc_name" {
    default = "Sushil-vpc"
}

resource "aws_vpc" "sushil-vpc" {
  cidr_block = var.cidr
    tags = {
        "Name" = "Sushil1-VPC"
    }
}

data "aws_availability_zones" "azs" {

}


resource "aws_subnet" "subnet" {
  count      = length(data.aws_availability_zones.azs.names)
  cidr_block = "10.0.${count.index + 1}.0/24"
  vpc_id = aws_vpc.sushil-vpc.id
  tags = {
      "Name" = "${var.vpc_name}_Private-10.0.${count.index + 1}.0/24"
  }
}




