variable "frontend_subnet_id" {
  description = "The ID of the frontend subnet."
  type        = string
}

variable "backend_subnet_id" {
  description = "The ID of the backend subnet."
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the network security group."
  type        = string
  
}
