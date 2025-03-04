# Terraform Azure Kubernetes Cluster Setup

This repository contains the Terraform configuration to deploy an Azure infrastructure with the following resources:

- Resource Group
- Virtual Network
- Subnet
- Kubernetes Cluster (AKS)

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated using `az login`.
- Azure subscription (you can set this in the `provider` block).
- Git installed on your machine.

## Setup and Usage

### 1. Clone the Repository
First, clone the repository to your local machine:

```bash
git clone https://github.com/your-username/your-repository.git
cd your-repository
```
### 2. Initialize Terraform
To initialize the Terraform working directory and download necessary provider plugins, run:

```bash
terraform init
```
This command will configure the backend, download the required provider plugins, and initialize the Terraform environment.

### 3. Validate Configuration
To ensure that your Terraform configuration is syntactically correct, use the following command:

```bash
terraform validate
```
This will validate the configuration files but not apply any changes to the infrastructure.

### 4. Plan the Deployment
To preview the infrastructure changes that will be made by Terraform, run:
```bash
terraform plan
```
This shows a preview of the changes Terraform will make when applying the configuration. Review this plan carefully before proceeding.

### 5. Apply the Configuration
To apply the Terraform configuration and provision the Azure resources, run:
```bash
terraform apply
```
Terraform will prompt for confirmation before making changes. Type yes to proceed and apply the configuration.

# Key Feature: Minimal Downtime Upgrade
This configuration is designed to upgrade the Kubernetes cluster with minimal downtime by leveraging the following techniques:
# Auto-scaling
The cluster automatically adjusts the number of nodes based on demand.
# Multiple Availability Zones
The cluster is deployed across multiple availability zones to ensure high availability during upgrades.
# Node Pool Upgrade: 
The Kubernetes nodes are upgraded with minimal disruption by using the max_surge parameter, which ensures that only a small portion of the nodes are upgraded at a time.

These features ensure that the Kubernetes cluster remains available and performant during the upgrade process.
