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
