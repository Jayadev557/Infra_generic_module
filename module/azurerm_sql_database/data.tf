data "azurerm_mssql_server" "server_data_block" {
  for_each            = var.sql_databases
  name                = each.value.sql_svr_name
  resource_group_name = each.value.rg_name
}
