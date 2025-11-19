# Infra_generic_module

**Terraform Azure Infrastructure — README**
**📘 Overview**

Ye Terraform project Azure me ek complete, production-ready infrastructure deploy karta hai.
Infrastructure modular, generic, aur reusable banaya gaya hai. Har resource ke liye module use hua hai, jisme:

dynamic blocks
for_each loops
variables + tfvars

root module → child modules ke inputs ka istemaal kiya gaya hai.

**🏗️ Infrastructure Components**

Is project se niche diye gaye Azure resources create hote hain:

**1. Resource Group**
  1 Central Resource Group jisme sabhi resources deploy hote hain.
**2. Virtual Network (VNet)**
  1 VNet with configurable address space.
**3. Subnets**
  2 Subnets
    App / VM subnet
    Database / Backend subnet
    Subnets dynamically create hote hain using for_each.

**4. Virtual Machines**
  2 Linux/Windows VMs (configurable)

  Each VM:
    NIC
    Public IP (optional)
    OS disk config
    NSG rules (if enabled)

**5. SQL Server (Azure SQL Server)**
Fully parameterized
Firewall rules, AD admin (optional)

**6. SQL Database**
1 SQL Database attached to SQL server
DTU/Compute tier variables se control hota hai

**7. Storage Account**
  1 Storage Account with:
    Standard/Premium config
    Replication (LRS/ZRS) as variable

**8. Key Vault**
  1 Key Vault for secure secret storage

**9. Key Vault Secret**
VM admin password ya SQL password automatically secret store hota hai

**10. NIC + Public IP**
Each VM ke liye dedicated:
Network Interface
Public IP (conditional or default)
