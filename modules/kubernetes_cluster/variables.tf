variable "kubernetes_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the AKS cluster will be created"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM for the node pool"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "node_count" {
  description = "Initial number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "min_count" {
  description = "Minimum number of nodes for autoscaling"
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
  default     = 2
}

variable "zones" {
  description = "Availability zones for node pool"
  type        = list(string)
}

variable "auto_scaling_enabled" {
  description = "Enable autoscaling for node pool"
  type        = bool
  default     = true
}

variable "max_surge" {
  description = "Max surge percentage during an upgrade"
  type        = string
  default     = "10%"
}
