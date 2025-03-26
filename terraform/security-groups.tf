# security-groups.tf
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Security group for web server"
  vpc_id      = var.vpc_id

  # SSH access from your computer
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open SSH to all IPs, but use key-based authentication
  }

  # HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Node.js app port
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web Server Security Group"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db-server-sg"
  description = "Security group for database server"
  vpc_id      = var.vpc_id

  # MongoDB access from web server
  ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    security_group_id = aws_security_group.web_sg.id
  }

  # SSH access only from web server
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_group_id = aws_security_group.web_sg.id
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database Server Security Group"
  }
}
