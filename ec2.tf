resource "aws_instance" "pubvm1" {
  ami             = var.ami1
  instance_type   = var.type
associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id       = aws_subnet.pubsub1.id
  user_data       = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  EOF
  tags = {
    Name = "pubvm1ubuntu1"
  }


}

resource "aws_instance" "pubvm2" {
  ami             = var.ami2
  instance_type   = var.type
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id       = aws_subnet.pubsub2.id
  user_data       = <<-EOF
  #!/bin/bash
  sudo yum install httpd -y
  sudo service httpd start
  sudo service httpd status
  EOF
 tags = {
    Name = "pubvm2linux"
  }

}
