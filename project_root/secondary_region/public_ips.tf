resource "azurerm_public_ip" "secondary-business-ip" {
  for_each            = var.ip_map
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.secondary_rg.name
  location            = data.azurerm_resource_group.secondary_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = each.value.zones
  tags = {
    environment = "dev"
  }
}

resource "azurerm_public_ip" "secondary-web-ip" {
  name                = "web-ip"
  resource_group_name = data.azurerm_resource_group.secondary_rg.name
  location            = data.azurerm_resource_group.secondary_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1", "2", "3"]
  tags = {
    environment = "dev"
  }
}