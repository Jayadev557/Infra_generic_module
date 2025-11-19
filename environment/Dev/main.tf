module "resource_group" {
  source     = "../../module/azurerm_resource_grp"
  rg_details = var.rgs
}

module "storage_account" {
  depends_on  = [module.resource_group]
  source      = "../../module/azurerm_storage_account"
  stg_details = var.stg_details
}

module "networking" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_networks"
  networks   = var.networks
}

module "public_ip" {
  depends_on  = [module.resource_group]
  source      = "../../module/azurerm_public_ip"
  pip_details = var.pip_details
}

module "network_interface" {
  depends_on = [module.resource_group, module.networking]
  source     = "../../module/compute"
  vms        = var.vms
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_key_vault"
  kv         = var.kv
}

module "key_vault_secret" {
  depends_on = [module.key_vault]
  source     = "../../module/azurerm_kv_secret"
  kv_data    = var.kv_data
  kv_secret  = var.kv_secret
}


module "mssql_server" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_sql_server"
  sql_server = var.sql_servers
}


module "mssql_database" {
  depends_on    = [module.mssql_server, module.resource_group]
  source        = "../../module/azurerm_sql_database"
  sql_databases = var.sql_databases
}



# module "kv_secret" {
#   depends_on = [ module.resource_group ]
#   source = "../../module/azurerm_kv_secret"
#   kv_sec = var.kv_sec
#   kv = var.kv

# }
