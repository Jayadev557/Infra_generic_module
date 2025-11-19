resource "azurerm_storage_account" "stg_block" {
  for_each                 = var.stg_details
  name                     = each.value.stg_name
  location                 = each.value.location
  resource_group_name      = each.value.rg_name
  account_replication_type = each.value.account_replication_type
  account_tier             = each.value.account_tier
  access_tier              = each.value.access_tier
  account_kind             = each.value.account_kind
  is_hns_enabled           = each.value.is_hns_enabled
  tags                     = each.value.tags
}
