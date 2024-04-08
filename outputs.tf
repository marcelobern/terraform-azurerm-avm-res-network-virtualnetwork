output "subnets" {
  description = "Information about the subnets created in the module."
  value = {
    for s in azurerm_subnet.subnet : s.name => {
      id               = s.id
      address_prefixes = s.address_prefixes
      resource_group   = s.resource_group_name
      virtual_network  = s.virtual_network_name
      nsg_association  = try(azurerm_subnet_network_security_group_association.vnet[s.name], null)
    }
  }
}

output "virtual_network_id" {
  description = "The resource ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_resource" {
  description = "The Azure Virtual Network resource"
  value       = azurerm_virtual_network.vnet
}
