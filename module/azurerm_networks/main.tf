resource "azurerm_virtual_network" "network_block" {
  for_each            = var.networks
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
  private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
  tags                = each.value.tags

  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan == null ? [] : each.value.ddos_protection_plan
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption == null ? [] : each.value.encryption
    content {
      enforcement = encryption.value.enforcement
    }
  }

  dynamic "subnet" {
    for_each = each.value.subnets == null ? [] : each.value.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}





