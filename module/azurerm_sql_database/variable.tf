variable "sql_databases" {
  type = map(object({
    db_name      = string
    tag          = optional(map(string))
    sql_svr_name = string
    rg_name      = string
    # prevent_destroy = optional(bool, true)
  }))
}
