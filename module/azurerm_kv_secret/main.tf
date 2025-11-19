resource "azurerm_key_vault_secret" "kv_secret_block" {
  for_each     = var.kv_secret
  name         = each.value.kv_secret_name
  value        = each.value.kv_secret_value
  key_vault_id = data.azurerm_key_vault.kv_data_block[each.key].id
}

variable "kv_secret" {
  type = map(object({
    kv_secret_name  = string
    kv_secret_value = string
  }))
}

variable "kv_data" {
  type = map(object({
    kv_name = string
    rg_name = string
  }))
}

data "azurerm_key_vault" "kv_data_block" {
  for_each            = var.kv_data
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}
