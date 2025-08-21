# get current account details

data "aws_caller_identity" "current" {}

data "aws_vpc" "samanja-vpc" {
  cidr_block = "10.0.0.0/16"
  filter {
    name   = "tag:Name"
    values = ["samanja-vpc"]
  }
}

data "aws_subnet" "private_subnet_1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_2" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_3" {
  cidr_block = "10.0.3.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_4" {
  cidr_block = "10.0.4.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_5" {
  cidr_block = "10.0.5.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_6" {
  cidr_block = "10.0.6.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_7" {
  cidr_block = "10.0.7.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_8" {
  cidr_block = "10.0.8.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_9" {
  cidr_block = "10.0.9.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_10" {
  cidr_block = "10.0.10.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_11" {
  cidr_block = "10.0.11.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_12" {
  cidr_block = "10.0.12.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_13" {
  cidr_block = "10.0.13.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_14" {
  cidr_block = "10.0.14.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_15" {
  cidr_block = "10.0.15.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "private_subnet_16" {
  cidr_block = "10.0.16.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "public_subnet_1" {
  cidr_block = "10.0.101.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}

data "aws_subnet" "public_subnet_2" {
  cidr_block = "10.0.102.0/24"
  vpc_id     = data.aws_vpc.samanja-vpc.id
}


data "aws_region" "current" {}

# data "aws_eks_cluster" "cluster" {
#   name = module.eks.cluster_name
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = module.eks.cluster_name
# }
