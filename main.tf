provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

module "aws_key_pair" {
  source = "./modules/aws_key_pair"

  key_name   = "my_key"
  public_key = "echo $SSH_PUB_KEY"
}

module "instance" {
  source = "./modules/instance"
  count  = 3

  ami                        = "ami-067a92fcca2611950"
  instance_type              = "t3.micro"
  vpc_security_group_ids     = ["sg-0e69d6b9725931ac9"]
  key_name                   = module.aws_key_pair.key_name
  # subnet_id                  = 

  # count_az                   = lenght(module.instance[*].availability_zone)
  # availability_zone          = module.instance.availability_zone
  name                       = "WS${count.index + 1}"

  template = file("./modules/instance/startup_ws${count.index + 1}.sh")
}

module "lb" {
  source = "./modules/lb"

  name                       = "lb"
  load_balancer_type         = "application"
  internal                   = false
  security_groups            = ["sg-0e69d6b9725931ac9"]
  subnets                    = ["subnet-02d7794502250b9c9", "subnet-0291cd7554bab528c", "subnet-0fa29bfb61f9a3898"]
  enable_deletion_protection = false
  environment                = "lb"
}

module "lb_target_group" {
  source = "./modules/lb_target_group"

  name                = "tf-lb-tg"
  port                = 80
  protocol            = "HTTP"
  vpc_id              = "vpc-00eb46f508afe2875"
  target_type         = "instance"
  
  count               = length(module.instance[*].ec2_id)
  instance_ec2_id     = module.instance[count.index].ec2_id
  # target_group_arn    = module.lb_target_group.tg_arn
  # target_id = module.instance[0].ec2_id
  # target_id        = aws_instance.test.id
}

module "lb_listener" {
  source = "./modules/lb_listener"

  load_balancer_arn         = module.lb.ws_arn
  port                      = "80"
  protocol                  = "HTTP"
  default_action            = "forward"
  target_group_arn          = module.lb_target_group[0].tg_arn
}