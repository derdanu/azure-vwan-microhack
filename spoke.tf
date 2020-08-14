#######################################################################
## Create Virtual Network - Spoke 1
#######################################################################

resource "azurerm_virtual_network" "spoke-1-vnet" {
  name                = "spoke-1-vnet"
  location            = var.location-spoke-1
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = ["172.16.1.0/24"]

  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}

#######################################################################
## Create Subnets - Spoke 1
#######################################################################

resource "azurerm_subnet" "spoke-1-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefix       = "172.16.1.0/25"
}
resource "azurerm_subnet" "bastion-spoke-1-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefix       = "172.16.1.128/27"
}
#######################################################################
## Create Virtual Network - Spoke 2
#######################################################################

resource "azurerm_virtual_network" "spoke-2-vnet" {
  name                = "spoke-2-vnet"
  location            = var.location-spoke-2
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = ["172.16.2.0/24"]

  tags = {
    environment = "spoke-2"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Subnets - Spoke 2
#######################################################################
resource "azurerm_subnet" "spoke-2-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-2-vnet.name
  address_prefix       = "172.16.2.0/25"
}
resource "azurerm_subnet" "bastion-spoke-2-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-2-vnet.name
  address_prefix       = "172.16.2.128/27"
}
#######################################################################
## Create Virtual Network - Spoke 3
#######################################################################
resource "azurerm_virtual_network" "spoke-3-vnet" {
  name                = "spoke-3-vnet"
  location            = var.location-spoke-3
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = ["172.16.3.0/24"]

  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Subnets - Spoke 3
#######################################################################
resource "azurerm_subnet" "spoke-3-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-3-vnet.name
  address_prefix       = "172.16.3.0/25"
}
resource "azurerm_subnet" "bastion-spoke-3-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-3-vnet.name
  address_prefix       = "172.16.3.128/27"
}
#######################################################################
## Create Virtual Network - Spoke 4
#######################################################################

resource "azurerm_virtual_network" "spoke-4-vnet" {
  name                = "spoke-4-vnet"
  location            = var.location-spoke-4
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = ["172.16.4.0/24"]

  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Subnets - Spoke 4
#######################################################################

resource "azurerm_subnet" "spoke-4-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-4-vnet.name
  address_prefix       = "172.16.4.0/25"
}
resource "azurerm_subnet" "bastion-spoke-4-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-4-vnet.name
  address_prefix       = "172.16.4.128/27"
}
#######################################################################
## Create Virtual Network - Onprem
#######################################################################

resource "azurerm_virtual_network" "onprem-vnet" {
  name                = "onprem-vnet"
  location            = var.location-onprem
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = ["10.0.1.0/24","10.0.2.0/24"]

  tags = {
    environment = "onprem"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Subnets - onprem
#######################################################################
resource "azurerm_subnet" "onprem-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.onprem-vnet.name
  address_prefix       = "10.0.1.0/25"
}
resource "azurerm_subnet" "bastion-onprem-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.onprem-vnet.name
  address_prefix       = "10.0.1.128/27"
}
resource "azurerm_subnet" "onprem-gateway-subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.onprem-vnet.name
  address_prefix       = "10.0.1.160/27"
}
#######################################################################
## Create Virtual Network - Services
#######################################################################
resource "azurerm_virtual_network" "services-vnet" {
  name                = "services-vnet"
  location            = var.location-spoke-services
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = ["172.16.10.0/24"]

  tags = {
    environment = "services"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Subnets - Services
#######################################################################

resource "azurerm_subnet" "services-vm-1-subnet" {
  name                 = "servicesSubnet-1"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.services-vnet.name
  address_prefix       = "172.16.10.0/25"
}
resource "azurerm_subnet" "services-vm-2-subnet" {
  name                 = "servicesSubnet-2"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.services-vnet.name
  address_prefix       = "172.16.10.128/27"
}
resource "azurerm_subnet" "bastion-services-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.services-vnet.name
  address_prefix       = "172.16.10.160/27"
}
#######################################################################
## Create Network Interface - Spoke 1
#######################################################################

resource "azurerm_network_interface" "spoke-1-nic" {
  name                 = "spoke-1-nic"
  location             = var.location-spoke-1
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-1-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-1-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Network Interface - Spoke 2
#######################################################################

resource "azurerm_network_interface" "spoke-2-nic" {
  name                 = "spoke-2-nic"
  location             = var.location-spoke-2
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-2-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-2-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Network Interface - Spoke 3
#######################################################################

resource "azurerm_network_interface" "spoke-3-nic" {
  name                 = "spoke-3-nic"
  location             = var.location-spoke-3
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-3-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-3-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Network Interface - Spoke 4
#######################################################################

resource "azurerm_network_interface" "spoke-4-nic" {
  name                 = "spoke-4-nic"
  location             = var.location-spoke-4
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-4"
    subnet_id                     = azurerm_subnet.spoke-4-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Network Interface - Spoke onprem
#######################################################################

resource "azurerm_network_interface" "onprem-nic" {
  name                 = "onprem-nic"
  location             = var.location-onprem
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "onprem-ipconfig"
    subnet_id                     = azurerm_subnet.onprem-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "onprem"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Network Interface - ADDC
#######################################################################

resource "azurerm_network_interface" "spoke-addc-1-nic" {
  name                 = "spoke-addc-1-nic"
  location             = var.location-spoke-services
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "addc-1-ipconfig"
    subnet_id                     = azurerm_subnet.services-vm-1-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "services"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}

resource "azurerm_network_interface" "spoke-addc-2-nic" {
  name                 = "spoke-addc-2-nic"
  location             = var.location-spoke-services
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "addc-2-ipconfig"
    subnet_id                     = azurerm_subnet.services-vm-2-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "services"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Virtual Machine spoke-1
#######################################################################

resource "azurerm_virtual_machine" "spoke-1-vm" {
  name                  = "spoke-1-vm"
  location              = var.location-spoke-1
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-1-nic.id]
  vm_size               = var.vmsize

  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "spoke-1-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "spoke-1-vm"
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Virtual Machine spoke-2
#######################################################################
resource "azurerm_virtual_machine" "spoke-2-vm" {
  name                  = "spoke-2-vm"
  location              = var.location-spoke-2
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-2-nic.id]
  vm_size               = var.vmsize

  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "spoke-2-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "spoke-2-vm"
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  tags = {
    environment = "spoke-2"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Virtual Machine spoke-3
#######################################################################
resource "azurerm_virtual_machine" "spoke-3-vm" {
  name                  = "spoke-3-vm"
  location              = var.location-spoke-3
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-3-nic.id]
  vm_size               = var.vmsize

  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "spoke-3-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "spoke-3-vm"
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Virtual Machine spoke-4
#######################################################################
resource "azurerm_virtual_machine" "spoke-4-vm" {
  name                  = "spoke-4-vm"
  location              = var.location-spoke-4
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-4-nic.id]
  vm_size               = var.vmsize

  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "spoke-4-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "spoke-4-vm"
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Virtual Machine onprem
#######################################################################
resource "azurerm_virtual_machine" "onprem-vm" {
  name                  = "onprem-vm"
  location              = var.location-onprem
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.onprem-nic.id]
  vm_size               = var.vmsize

  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "onprem-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "onprem-vm"
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  tags = {
    environment = "onprem"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
#######################################################################
## Create Virtual Machine spoke-addc
#######################################################################
resource "azurerm_virtual_machine" "spoke-addc-vm" {
  name                  = "spoke-addc-vm"
  location              = var.location-spoke-services
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  primary_network_interface_id = azurerm_network_interface.spoke-addc-1-nic.id
  network_interface_ids = [azurerm_network_interface.spoke-addc-1-nic.id,azurerm_network_interface.spoke-addc-2-nic.id]
  vm_size               = var.vmsize

  storage_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "spoke-addc-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "spoke-addc-vm"
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  tags = {
    environment = "addc"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}



