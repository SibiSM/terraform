provider "azurerm" {
  features {}
  #subscription_id = " " # Replace with your subscription ID
}

module "resource_group_name" {
  source = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location = var.location
}

module "virtual_network" {
  source = "./modules/virtual_network"
  virtual_network_name = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location = var.location
  address_space = var.address_space
  depends_on = [ module.resource_group_name ]
}

module "subnet" {
  source = "./modules/subnet"
  subnet_name = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name = var.resource_group_name
  address_prefixes = var.address_prefixes
  depends_on = [ module.virtual_network ]
}

module "kubernetes_cluster" {
  source                = "./modules/kubernetes_cluster"
  kubernetes_cluster_name = var.kubernetes_cluster_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  kubernetes_version   = var.kubernetes_version
  vm_size              = "Standard_B2s_v2"
  node_count           = 1
  min_count            = 1
  max_count            = 2
  zones                = ["2", "3"]
  auto_scaling_enabled = true
  max_surge            = "10%"
  depends_on = [ module.subnet ]
}

# resource "azurerm_kubernetes_cluster_node_pool" "user_pool" {
#   name                  = "userpool"  # Unique name (not 'newpool')
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.kubernetes_cluster.id
#   vm_size               = "Standard_Bs_v2"
#   node_count            = 2
#   min_count             = 2
#   max_count             = 2
#   auto_scaling_enabled  = true
#   mode                  = "User"  # Secondary node pool
#   orchestrator_version  = var.kubernetes_version
#   upgrade_settings {
#     max_surge = "10%"
#   }
#   depends_on = [ module.subnet ]
# }