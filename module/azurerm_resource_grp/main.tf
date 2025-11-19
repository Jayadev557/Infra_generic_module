resource "azurerm_resource_group" "rg_block" {
    for_each = var.rg_details
    name = each.value.rg_name
    location = each.value.location
    managed_by = each.value.managed_by
    tags = each.value.tags  
}