resource "random_string" "random" {
  length = 3
  special = false
  upper   = false
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group}_${var.environment}_${random_string.random.result}"
  location = var.location
}


resource "azurerm_virtual_network" "example" {
  name                = "${var.dns_prefix}-network"
  location            = "${azurerm_resource_group.resource_group.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.resource_group.name}"
  address_prefix       = "10.1.0.0/24"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
}



resource "azurerm_kubernetes_cluster" "terraform-k8s" {
  name                = "${var.cluster_name}_${var.environment}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    
    name                = "pool1"
    //count               = 1
    vm_size             = "Standard_DS1_v2"
    //os_type             = "Linux"
    os_disk_size_gb     = 30
    max_pods            = 30
    //availability_zones  = [1, 2, 3]
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
    vnet_subnet_id      = "${azurerm_subnet.example.id}"
    
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = var.environment
  }
}


# The below command is for being able to use the kubectl commands to the aks
# az aks get-credentials --name k8stest_dev --resource-group kubernetes_dev_6mq