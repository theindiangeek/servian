locals {
  ec2-instance = {
    "test" = {
      amiID = data.aws_ami.ami-AL2.id
      subnet_id = module.subnet-app-with-ig-a.id
      security_groups = [module.sg-public.sg["public-access"].id]
      instanceType = "t3.medium"
      key_name = local.key
      user_data = file("${path.module}/startup.sh")
      common-tags = {
        Name = "servian-assignment-instance"
      }
    }
  }
  sg = {
    public-access = {
      ingress = [{
        description      = "Allow public port 3000 access"
        from_port        = 3000
        to_port          = 3000
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
      },
      {
        description      = "Allow public port 22 access"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
      }]
      egress = [{
        description      = "Allow all outbound access"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }]
    }
  }
  key = "assignment"
}
