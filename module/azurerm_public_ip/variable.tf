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
