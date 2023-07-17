# main.tf

terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.59"
    }
  }
}

provider "snowflake" {
  role  = "SYSADMIN"
}

resource "snowflake_database" "db" {
  name     = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "large"

  auto_suspend = 60
}


# provider "snowflake" {
#   account   = "<account_name>"
#   username  = "<username>"
#   password  = "<password>"
#   warehouse = "<warehouse>"
#   role      = "<role>"
# }

# module "read_role" {
#   source          = "./modules/read_role"
#   role_name       = "READ_ROLE"
#   database_name   = var.database_name
#   schema_name     = var.schema_name
# }

# module "read_write_role" {
#   source          = "./modules/read_write_role"
#   role_name       = "READ_WRITE_ROLE"
#   database_name   = var.database_name
#   schema_name     = var.schema_name
#   depends_on      = [module.read_role]
# }

# module "full_control_role" {
#   source          = "./modules/full_control_role"
#   role_name       = "FULL_CONTROL_ROLE"
#   database_name   = var.database_name
#   schema_name     = var.schema_name
#   depends_on      = [module.read_write_role]
# }
