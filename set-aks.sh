#!/usr/bin/env bash

# Log yourself into Azure
az login

# Configure kubectl
az aks get-credentials --resource-group SI-03-AKS-Cluster-rg --name SI-03-AKS-Cluster

# Access Kubernetes Dashboard
az aks browse --resource-group SI-03-AKS-Cluster-rg --name SI-03-AKS-Cluster 