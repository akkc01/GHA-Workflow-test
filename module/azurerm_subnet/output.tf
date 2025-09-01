output "frontend_subnet_id" {
  description = "The ID of the Subnet."
  value       = azurerm_subnet.frontend_subnet.id
  
}


output "backend_subnet_id" {
  description = "The ID of the Subnet."
  value       = azurerm_subnet.backend_subnet.id
  
}

