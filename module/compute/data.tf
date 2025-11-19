data "azurerm_subnet" "subnet_data_block" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip_data_block" {
  # for_each            = var.vms

  for_each = {
    for k, v in var.vms :
    k => v
    if v.enable_public_ip == true && v.pip_name != null
  }
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}


# data "azurerm_key_vault" "kv_data" {
#   for_each            = var.vms
#   name                = each.value.kv_name
#   resource_group_name = each.value.rg_name
# }

# data "azurerm_key_vault_secret" "vm_username" {
#   for_each = var.vms
#   name         = "vm-username"
#   key_vault_id = data.azurerm_key_vault.kv_data[each.key].id
# }

# data "azurerm_key_vault_secret" "vm_password" {
#   for_each = var.vms
#   name         = "vm-password"
#   key_vault_id = data.azurerm_key_vault.kv_data[each.key].id
# }
