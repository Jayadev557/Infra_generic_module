resource "azurerm_mssql_server" "sql_serv" {
  for_each                     = var.sql_server
  name                         = each.value.sql_svr_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = "1.2"
  tags                         = each.value.tags

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator == null ? {} : each.value.azuread_administrator
    content {
      login_username = azuread_administrator.value.login_username
      object_id      = azuread_administrator.value.object_id
    }
  }
}
