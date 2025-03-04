resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = var.kubernetes_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.kubernetes_cluster_name
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                = "default"
    vm_size             = var.vm_size
    node_count          = var.node_count
    orchestrator_version = var.kubernetes_version
    min_count           = var.min_count
    max_count           = var.max_count
    zones               = var.zones
    temporary_name_for_rotation = "temp"
    auto_scaling_enabled = true
    upgrade_settings {
      max_surge = var.max_surge
    }
  }

  identity {
    type = "SystemAssigned"
  }
}

# resource "azurerm_kubernetes_cluster_node_pool" "user_pool" {
#   name                  = "userpool"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.kubernetes_cluster.id
#   vm_size               = var.vm_size
#   node_count            = var.node_count
#   min_count             = var.min_count
#   max_count             = var.max_count
#   auto_scaling_enabled  = var.auto_scaling_enabled
#   mode                  = "User"
#   orchestrator_version  = var.kubernetes_version

#   upgrade_settings {
#     max_surge = var.max_surge
#   }
# }
