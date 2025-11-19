resource "azurerm_public_ip" "pip_block" {
  for_each             = var.pip_details
  name                 = each.value.pip_name
  resource_group_name  = each.value.rg_name
  location             = each.value.location
  allocation_method    = each.value.allocation_method
  tags                 = each.value.tags
  ddos_protection_mode = each.value.ddos_protection_mode
  sku                  = each.value.sku
}
