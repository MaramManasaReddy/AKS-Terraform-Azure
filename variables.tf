variable "resource_group_name" {
  default = "aks-demo-rg"
}

variable "location" {
  default = "East US"
}

variable "aks_cluster_name" {
  default = "aks-demo-cluster"
}

variable "node_count" {
  default = 1
}
