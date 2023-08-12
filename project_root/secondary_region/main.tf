# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    virtual_machine_scale_set {
      force_delete                  = false
      roll_instances_when_required  = true
      scale_to_zero_before_deletion = true
    }
  }
}

data "azurerm_resource_group" "primary_rg" {
  name = "RG-Primary-Region"
}

data "azurerm_resource_group" "secondary_rg" {
  name = "RG-Secondary-Region"
}

data "azurerm_virtual_network" "primary_network" {
  name = "primary-network"
  resource_group_name = "RG-Primary-Region"
}

data "azurerm_virtual_network" "secondary_network" {
  name = "secondary-network"
  resource_group_name = "RG-Secondary-Region"
}

data "azurerm_storage_account" "primary_web_storage"{
  name = "primarywebstorage"
  resource_group_name = azurerm_resource_group.primary_rg.name
}

data "azurerm_storage_container" "primary_web_container"{
  name = "primary_web_container"
  storage_account_name = "primarywebstorage"
}

data "azurerm_storage_account" "primary_business_storage"{
  name = "primarybusinessstorage"
  resource_group_name = azurerm_resource_group.primary_rg.name
}

data "azurerm_storage_container" "primary_business_container"{
  name = "primary_business_container"
  storage_account_name = "primarybusinessstorage"
}

data "azurerm_storage_account" "secondary_web_storage"{
  name = "secondarywebstorage"
  resource_group_name = "RG-Secondary-Region"
}

data "azurerm_storage_container" "secondary_web_container"{
  name = "secondary_web_container"
  storage_account_name = "secondarywebstorage"
}

data "azurerm_storage_account" "secondary_business_storage"{
  name = "secondarybusinessstorage"
  resource_group_name = "RG-Secondary-Region"
}

data "azurerm_storage_container" "secondary_business_container"{
  name = "secondary_business_container"
  storage_account_name = "secondarybusinessstorage"
}