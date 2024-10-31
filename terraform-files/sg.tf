resource "aws_security_group" "sg-master" {
  name_prefix = format("%s-%s-%s-master", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Kubernetes API server"
  }

  ingress {
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
    description = "etcd server client API"
  }

  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
    description = "Kubelet API"
  }

  ingress {
    from_port   = 10259
    to_port     = 10259
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
    description = "kube-scheduler"
  }

  ingress {
    from_port   = 10257
    to_port     = 10257
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
    description = "kube-controller-manager"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



  ingress {
    description      = "All ICMP from master"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    security_groups  = ["sg-091c1d92d1dbcc333"]
  }

  ingress {
    description      = "All ICMP from node"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    security_groups  = ["sg-0042f3aadbc985989"]
  }

  ingress {
    description      = "Custom UDP"
    from_port        = 8472
    to_port          = 8472
    protocol         = "udp"
    security_groups  = ["sg-091c1d92d1dbcc333"]
  }

  ingress {
    description      = "Custom UDP"
    from_port        = 8472
    to_port          = 8472
    protocol         = "udp"
    security_groups  = ["sg-0042f3aadbc985989"]
  }

  ingress {
    description      = "Custom TCP"
    from_port        = 30000
    to_port          = 32767
    protocol         = "tcp"
    security_groups  = ["sg-0042f3aadbc985989"]
  }

  ingress {
    description      = "Custom TCP"
    from_port        = 30000
    to_port          = 32767
    protocol         = "tcp"
    security_groups  = ["sg-091c1d92d1dbcc333"]
  }

  ingress {
    description      = "Custom TCP"
    from_port        = 4240
    to_port          = 4240
    protocol         = "tcp"
    security_groups  = ["sg-091c1d92d1dbcc333"]
  }

  ingress {
    description      = "Custom TCP"
    from_port        = 4240
    to_port          = 4240
    protocol         = "tcp"
    security_groups  = ["sg-0042f3aadbc985989"]
  }



  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-master", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}




resource "aws_security_group" "sg-node" {
  name_prefix = format("%s-%s-%s-node", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
    description = "Kubelet API"
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "NodePort Services"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description      = "All ICMP from master"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    security_groups  = ["sg-091c1d92d1dbcc333"]
  }

  ingress {
    description      = "All ICMP from node"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    security_groups  = ["sg-0042f3aadbc985989"]
  }

  ingress {
    description      = "Custom UDP"
    from_port        = 8472
    to_port          = 8472
    protocol         = "udp"
    security_groups  = ["sg-091c1d92d1dbcc333"]
  }

  ingress {
    description      = "Custom UDP"
    from_port        = 8472
    to_port          = 8472
    protocol         = "udp"
    security_groups  = ["sg-0042f3aadbc985989"]
  }

  ingress {
    description      = "Custom TCP"
    from_port        = 30000
    to_port          = 32767
    protocol         = "tcp"
    security_groups  = ["sg-0042f3aadbc985989"]
  }

  ingress {
    description      = "Custom TCP"
    from_port        = 30000
    to_port          = 32767
    protocol         = "tcp"
    security_groups  = ["sg-091c1d92d1dbcc333"]
  }

  ingress {
    description      = "Custom TCP"
    from_port        = 4240
    to_port          = 4240
    protocol         = "tcp"
    security_groups  = ["sg-091c1d92d1dbcc333"]
  }

  ingress {
    description      = "Custom TCP"
    from_port        = 4240
    to_port          = 4240
    protocol         = "tcp"
    security_groups  = ["sg-0042f3aadbc985989"]
  }
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-node", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}

