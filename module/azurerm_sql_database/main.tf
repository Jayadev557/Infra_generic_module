resource "azurerm_mssql_database" "db_block" {
  for_each     = var.sql_databases
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.server_data_block[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = each.value.tag

  # prevent the possibility of accidental data loss

  lifecycle {
    prevent_destroy = false
  }

  #   dynamic "lifecycle" {
  #     for_each = each.value.prevent_destroy == true ? [1] : []
  #     content {
  #       prevent_destroy = true
  #     }
  #   }
}

