variable "sql_server" {
  type = map(object({
    sql_svr_name                 = string
    rg_name                      = string
    location                     = string
    administrator_login          = optional(string)
    administrator_login_password = optional(string)
    azuread_administrator = optional (map(object({
      login_username = string
      object_id      = string
    })))
    tags = optional(map(string))
  }))
}