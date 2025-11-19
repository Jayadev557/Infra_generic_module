resource "azurerm_network_interface" "nic_block" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  # Single NIC + Single IP Configuration //NA--Single NIC + MULTIPLE IP Configurations
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data_block[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = each.value.enable_public_ip ? data.azurerm_public_ip.pip_data_block[each.key].id : null
  }
}

resource "azurerm_linux_virtual_machine" "vm_block" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username  //data.azurerm_key_vault_secret.vm_username[each.key].id
  admin_password                  = each.value.admin_password  //data.azurerm_key_vault_secret.vm_password[each.key].id
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic_block[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}
