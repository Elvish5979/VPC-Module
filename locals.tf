locals {
  vpc_cidr = "10.124.0.0/16"
}

locals {
  security_groups = {
    public = {
      name        = "Public_sg"
      description = "Public Security group"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
    rds_sg = {
      name        = "RDS-SG"
      description = "Security group for RDS"
      ingress = {
        mysql = {
          from        = 3306
          to          = 3306
          protocol    = "tcp"
          cidr_blocks = [local.vpc_cidr]
        }
      }
    }
  }
}