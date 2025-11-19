variable "rgs" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}


variable "stg_details" {
  type = map(object({
    stg_name                 = string
    location                 = string
    rg_name                  = string
    account_replication_type = string
    account_tier             = string
    access_tier              = optional(string)
    account_kind             = optional(string)
    is_hns_enabled           = optional(bool)
    tags                     = optional(map(string))
  }))
}


variable "networks" {
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
    tags          = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
}


variable "pip_details" {
  type = map(object({
    pip_name             = string
    rg_name              = string
    location             = string
    allocation_method    = string
    ddos_protection_mode = optional(string)
    sku                  = optional(string)
    tags                 = optional(map(string))
  }))

}


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


variable "kv" {
  type = map(object({
    kv_name  = string
    location = string
    rg_name  = string

  }))
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



variable "sql_servers" {
  type = map(object({
    sql_svr_name                 = string
    rg_name                      = string
    location                     = string
    administrator_login          = optional(string)
    administrator_login_password = optional(string)
    azuread_administrator = optional(map(object({
      login_username = string
      object_id      = string
    })))
    tags = optional(map(string))
  }))
}




variable "sql_databases" {
  type = map(object({
    db_name      = string
    tag          = optional(map(string))
    sql_svr_name = string
    rg_name      = string
    # prevent_destroy = optional(bool, true)
  }))
}



# variable "kv_sec" {
#   type = map(object({
#     kv_sec_name  = string
#     kv_sec_value = optional(string)
#   }))
# }
