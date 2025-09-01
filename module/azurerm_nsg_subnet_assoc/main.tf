resource "azurerm_subnet_network_security_group_association" "nsga1" {
  subnet_id                 = var.frontend_subnet_id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_subnet_network_security_group_association" "nsga2" {
  subnet_id                 = var.backend_subnet_id
  network_security_group_id = var.network_security_group_id
}



