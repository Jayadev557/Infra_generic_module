output "server_ids" {
  value = { for k, v in azurerm_mssql_server.sql_serv : k => v.id }
}

output "server_names" {
  value = { for k, v in azurerm_mssql_server.sql_serv : k => v.name }
}