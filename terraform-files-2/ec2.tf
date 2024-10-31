resource "aws_instance" "master" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg-master.id]
  # User data script to set the hostname
  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname test-controlplane
              EOF
  tags = merge(var.common_tags, {
    Name   = "test-controlplane"
    },
  )
}

resource "aws_instance" "node-1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg-node.id]
  # User data script to set the hostname
  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname test-worker1
              EOF
  tags = merge(var.common_tags, {
    Name   = "test-worker1"
    },
  )
}

resource "aws_instance" "node-2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg-node.id]
  # User data script to set the hostname
  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname test-worker2
              EOF
  tags = merge(var.common_tags, {
    Name   = "test-worker2"
    },
  )
}