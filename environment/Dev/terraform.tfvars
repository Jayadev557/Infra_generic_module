#---------------------#
#   Resource Group    #
#---------------------#


rgs = {
  rg1 = {
    rg_name    = "jd-devrg001"
    location   = "Japan East"
    managed_by = null
    tags = {
      environment = "dev"
      owner       = "jd"
      project     = "todo_app"
      costcenter  = "IT-001"
    }
  }
}

#---------------------#
#   Storage Account   #
#---------------------#

stg_details = {
  stg1 = {
    stg_name                 = "devstgjd001"
    location                 = "Japan East"
    rg_name                  = "jd-devrg001"
    account_replication_type = "LRS"
    account_tier             = "Standard"
    access_tier              = "Cool"
    account_kind             = "StorageV2"
    is_hns_enabled           = "true"
    tags = {
      environment = "dev"
      owner       = "jd"
      project     = "todo_app"
      costcenter  = "IT-001"
    }
  }
}


#-----------------------------#
# Virtual Networks & Subnet   #
#-----------------------------#

networks = {
  vnet1 = {
    vnet_name     = "devvnet002"
    location      = "Japan East"
    rg_name       = "jd-devrg001"
    address_space = ["10.0.0.0/24"]
    tags = {
      environment = "dev"
      owner       = "jd"
      project     = "todo_app"
      costcenter  = "IT-001"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.0.0/28"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.0.64/28"]
      }
    ]
  }
}


#-------------#
# Public Ip   #
#-------------#

pip_details = {
  pip1 = {
    pip_name             = "fe-devjdpip001"
    rg_name              = "jd-devrg001"
    location             = "Japan East"
    allocation_method    = "Static"
    ddos_protection_mode = "Enabled"
    sku                  = "Standard"
    tags = {
      environment = "dev"
      owner       = "jd"
      project     = "todo_app"
      costcenter  = "IT-001"
    }
  }
  # pip2 = {
  #   pip_name             = "be-devjdpip001"
  #   rg_name              = "jd-devrg001"
  #   location             = "Japan East"
  #   allocation_method    = "Static"
  #   ddos_protection_mode = "Enabled"
  #   sku                  = "Standard"
  #   tags = {
  #     environment = "dev"
  #     owner       = "jd"
  #     project     = "todo_app"
  #     costcenter  = "IT-001"
  #   }
  # }
}


#------------------------#
# Virtual Machine + NIC  #
#------------------------#

vms = {
  vm1 = {
    nic_name         = "front-nic"
    location         = "Japan East"
    rg_name          = "jd-devrg001"
    subnet_name      = "frontend-subnet"
    pip_name         = "fe-devjdpip001"
    vnet_name        = "devvnet002"
    vm_name          = "frontendjdvm001"
    size             = "Standard_F2"
    kv_name          = "devkv"
    admin_username   = "adminuser"
    admin_password   = "admin@123456"
    enable_public_ip = true
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  vm2 = {
    nic_name    = "back-nic"
    location    = "Japan East"
    rg_name     = "jd-devrg001"
    subnet_name = "backend-subnet"
    # pip_name       = "be-devjdpip001"
    vnet_name        = "devvnet002"
    vm_name          = "backendjdvm001"
    kv_name          = "devkv"
    size             = "Standard_F2"
    admin_username   = "adminuser"
    admin_password   = "admin@123456"
    enable_public_ip = false
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}


#------------#
# Key Vault  #
#------------#

kv = {
  kv1 = {
    kv_name  = "devjdkv"
    location = "Japan East"
    rg_name  = "jd-devrg001"
  }
}


#-------------------#
# Key Vault Secret  #
#-------------------#

kv_data = {
  keyvault-dt1 = {
    kv_name = "devjdkv"
    rg_name = "jd-devrg001"
  }
}

kv_secret = {
  keyvault-dt1 = {
    kv_secret_name  = "username"
    kv_secret_value = "adminuser"
  }
  keyvault-dt1 = {
    kv_secret_name  = "password"
    kv_secret_value = "adminuser@123456"
  }
}

#---------------#
# mssql_server  #
#---------------#
sql_servers = {
  sqlserver1 = {
    sql_svr_name                 = "dev-sql-server001"
    rg_name                      = "jd-devrg001"
    location                     = "Japan East"
    administrator_login          = "adminuser"
    administrator_login_password = "sqlPassword@123456"
    tags = {
      environment = "dev"
      owner       = "jd"
      project     = "todo_app"
      costcenter  = "IT-001"
    }

  }
}

#-----------------#
# mssql_database  #
#-----------------#

sql_databases = {
  sql-db1 = {
    db_name      = "dev-jd-sql-db001"
    sql_svr_name = "dev-sql-server001"
    rg_name      = "jd-devrg001"
    # prevent_destroy = true
    tag = {
      environment = "dev"
      owner       = "jd"
      project     = "todo_app"
      costcenter  = "IT-001"
    }

  }
}




# kv_sec = {
#   kv_sec = {
#     kv_sec_name  = "devjd-secret"
#     kv_sec_value = "jdSecret123456"
#   }
# }




#-----------------------------#
# Virtual Networks & Subnet   #
#-----------------------------#
