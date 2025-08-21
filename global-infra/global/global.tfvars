################
# VPC variables
################
vpc_name                   = "samanja-vpc"
vpc_cidr                   = "10.0.0.0/16"
region                     = "eu-west-1"
private_subnets            = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24", "10.0.15.0/24", "10.0.16.0/24"]
public_subnets             = ["10.0.101.0/24", "10.0.102.0/24"]
database_subnets           = ["10.0.17.0/24", "10.0.18.0/24"]
database_subnet_group_name = "rds-global-vpc"




# #################################
# # IAM Group, User and Policy #
# #################################

Groups = {
  Developers = {
    group_name = "Developers"

    users       = ["stillashbeck@gmail.com"]
    create_user = true
  }

  Administrators = {
    group_name = "Administrators"
    users      = ["stillashbeck@gmail.com"]
    create_user = true

  }

  Tools = {
    group_name = "Tools"
    users      = ["argocd"]
    create_user = true
  }
}


############
# AWS ECR 
############

ecr_repos = {
  "frontend_landing_page" = {
    name = "frontend_landing_page"
    tags = {
      Name        = "frontend_landing_page"
      Description = "aFrontend Landing Page"
      Enviroment  = "anonprod"
    }
  }
  "postgres-backup" = {
    name = "postgres-backup"
    tags = {
      Name = "postgres-backup"
      Description = "postgres-backup ECR"
      Enviroment = "nonprod"
  }
}
  "ads_service" = {
    name = "ads_service"
    tags = {
      Name        = "ads_service"
      Description = "ADs Service ECR"
      Enviroment  = "anonprod"
    }
  }
  "authentication_service" = {
    name = "authentication_service"
    tags = {
      Name        = "authentication_service"
      Description = "Authentication Service ECR"
      Enviroment  = "nonprod"
    }
  }

  "samanja-ai-bot" = {
    name = "samanja-ai-bot"
    tags = {
      Name        = "samanja-ai-bot"
      Description = "samanja-ai-bot ECR"
      Enviroment  = "nonprod"
    }
  }
  "career_service" = {
    name = "career_service"
    tags = {
      Name        = "career_service"
      Description = "Career Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "chat_service" = {
    name = "chat_service"
    tags = {
      Name        = "chat_service"
      Description = "Chat Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "community_service" = {
    name = "community_service"
    tags = {
      Name        = "community_service"
      Description = "community Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "complaint_service" = {
    name = "complaint_service"
    tags = {
      Name        = "complaint_service"
      Description = "Complaint Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "forum_service" = {
    name = "forum_service"
    tags = {
      Name        = "forum_service"
      Description = "Forums Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "notification_service" = {
    name = "notification_service"
    tags = {
      Name        = "notification_service"
      Description = "Notification Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "recruitment_service" = {
    name = "recruitment_service"
    tags = {
      Name        = "recruitment_service"
      Description = "Recruitment Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "session_service" = {
    name = "session_service"
    tags = {
      Name        = "session_service"
      Description = "Session Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "strategy_service" = {
    name = "strategy_service"
    tags = {
      Name        = "strategy_service"
      Description = "Strategy Service ECR"
      Enviroment  = "nonprod"
    }
  }
  "gateway_service" = {
    name = "gateway_service"
    tags = {
      Name        = "gateway_service"
      Description = "Gateway API ECR"
      Enviroment  = "nonprod"
    }
  }

  "payment_service" = {
    name = "payment_service"
    tags = {
      Name        = "payment_service"
      Description = "payment_service App ECR"
      Enviroment  = "nonprod"
    }
  }

  "frontend_service" = {
    name = "frontend_service"
    tags = {
      Name        = "frontend_service"
      Description = "frontend App ECR"
      Enviroment  = "nonprod"
    }
  }

  "admin_frontend_service" = {
    name = "admin_frontend_service"
    tags = {
      Name        = "admin_frontend_service"
      Description = "admin_frontend_service App ECR"
      Enviroment  = "nonprod"
    }
  }

  "revamp_frontend_service" = {
    name = "revamp_frontend_service"
    tags = {
      Name        = "revamp_frontend_service"
      Description = "revamp_frontend_service App ECR"
      Enviroment  = "nonprod"
    }
  }

  "revamp_admin_frontend_service" = {
    name = "revamp_admin_frontend_service"
    tags = {
      Name        = "revamp_admin_frontend_service"
      Description = "revamp_admin_frontend_service App ECR"
      Enviroment  = "nonprod"
    }
  }
  "devops-helper-mgt" = {
    name = "devops-helper-mgt"
    tags = {
      Name        = "devops-helper-mgt"
      Description = "devops-helper-mgt ECR"
      Enviroment  = "nonprod"
    }
  }
  "redis-backup" = {
    name = "redis-backup"
    tags = {
      Name        = "redis-backup"
      Description = "redis-backup ECR"
      Enviroment  = "nonprod"
    }
  }
  "mongodb-backup" = {
    name = "mongodb-backup"
    tags = {
      Name        = "mongodb-backup"
      Description = "mongodb-backup ECR"
      Enviroment  = "nonprod"
    }
  }
  "optimized-image" = {
    name = "optimized-image"
    tags = {
      Name        = "optimized-image"
      Description = "optimized-image ECR"
      Enviroment  = "nonprod"
    }
  }
  "revamp_business_service" = {
    name = "revamp_business_service"
    tags = {
      Name        = "revamp_business_service"
      Description = "revamp_business_service ECR"
      Enviroment  = "nonprod"
    }
  }
  "ai-grader" = {
    name = "ai-grader"
    tags = {
      Name        = "ai-grader"
      Description = "ai-grader service ECR"
      Enviroment  = "prod"
    }
  }
  "voice-ai" = {
    name = "voice-ai"
    tags = {
      Name        = "voice-ai"
      Description = "voice-ai service ECR"
      Enviroment  = "prod"
    }
  }
}
