
module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tag = "samanja-ai"
}

module "ecs" {
  source =  "./modules/ecs"
  aws_region = "eu-west-2"
  tag  =  "samanja-ai-ecs"
  cluster_name =  "samanja-ai"
  samanja-ai_task_definition_family = "samanja-ai-frontend"
  samanja-ai_container_name = "samanja-ai-frontend"
  samanja-ai_image = "430471137496.dkr.ecr.eu-west-2.amazonaws.com/samanja-ai-landing:a6b07398"
  samanja-ai_service_name = "samanja-ai-service"
  samanja-ai_target_group_name = "samanja-ai-tg"
  certificate_arn = "arn:aws:acm:eu-west-2:430471137496:certificate/f8468306-221d-43f5-8a68-a6b04e3c6b24"
  container_port = 5173
  vpc_id =  module.vpc.vpc_id
  public_subnets_ids = module.vpc.public_subnets
  depends_on = [ module.vpc ]  
}