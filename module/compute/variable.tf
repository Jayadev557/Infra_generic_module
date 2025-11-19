variable "vms" {
  type = map(object({
    nic_name               = string
    location               = string
    rg_name                = string
    subnet_name            = string
    pip_name               = optional(string)
    vnet_name              = string
    vm_name                = string
    kv_name                = string
    size                   = string
    admin_username         = string
    admin_password         = string
    enable_public_ip       = bool
    source_image_reference = map(string)
  }))
}
