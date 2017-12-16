resource "aws_vpc" "hackathon" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "hackathon"
  }
}

resource "aws_subnet" "hackathon-subnet-public1" {
  vpc_id = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
}

resource "aws_subnet" "hackathon-subnet-public2" {
  vpc_id = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
}

resource "aws_subnet" "hackathon-subnet-public3" {
  vpc_id = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1c"
}

resource "aws_subnet" "hackathon-subnet-private4" {
  vpc_id = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1a"
}

resource "aws_subnet" "hackathon-subnet-private5" {
  vpc_id = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.5.0/24"
  availability_zone = "eu-west-1b"
}

resource "aws_subnet" "hackathon-subnet-private" {
  vpc_id = "${aws_vpc.hackathon.id}"
  cidr_block = "10.0.6.0/24"
  availability_zone = "eu-west-1c"
}
