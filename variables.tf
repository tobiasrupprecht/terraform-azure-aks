variable "location" {
  description = "Location of the AKS Cluster"
  default     = "West US 2"
}

variable "name" {
  description = "Name of the AKS Cluster"
  default     = "AKS-Cluster"
}

variable "prefix_name" {
  description = "Facility Location / Department that deploys AKS Cluster. Prefix for the name of the AKS Cluster"
  default     = "SI-03"
}

variable "environment" {
  description = "Environment of the AKS Cluster - Demo, Dev, QA, Prod"
  default     = "Dev"
}

variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}