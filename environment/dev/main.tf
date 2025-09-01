module "rg" {
  source   = "../../Module/azurerm_resource_group"
  rg_name  = "varddha-rg001"
  location = "centralindia"
}

module "vnet" {
  source        = "../../module/azurerm_virtual_network"
  depends_on    = [module.rg]
  vnet_name     = "varddha-vnet001"
  address_space = ["192.168.4.0/24"]
  rg_name       = "varddha-rg001"
  location      = "centralindia"

}

module "subnet" {
  source            = "../../module/azurerm_subnet"
  depends_on        = [module.rg, module.vnet]
  fsub_name         = "Khanshaar-Frontend"
  rg_name           = "varddha-rg001"
  address_prefixes  = ["192.168.4.0/26"]
  vnet_name         = "varddha-vnet001"
  bsub_name         = "Khanshaar-Backend"
  address_prefixes1 = ["192.168.4.64/26"]
}

module "nsg" {
  source   = "../../module/azurerm_network_security_group"
  depends_on = [ module.rg, module.vnet, module.subnet ]
  nsg_name = "varddha-nsg001"
  rg_name  = "varddha-rg001"
  location = "centralindia"

}
module "nsg_sub_asso" {
  depends_on = [ module.rg, module.vnet, module.subnet, module.nsg ]
  source                    = "../../module/azurerm_nsg_subnet_assoc"
  frontend_subnet_id        = module.subnet.frontend_subnet_id
  backend_subnet_id         = module.subnet.backend_subnet_id
  network_security_group_id = module.nsg.nsg_id
}

