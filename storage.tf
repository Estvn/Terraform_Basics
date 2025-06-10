resource "azurerm_storage_account" "saccount" {
    # El nombre del Storage Account tiene que ir todo junto
    name = "sa${ lower(var.project) }${ var.enviroment }"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    
    tags = var.tags
}

resource "azurerm_storage_container" "c1" {

    name = "imagenes"
    container_access_type = "private"
    storage_account_id = azurerm_storage_account.saccount.id
}

resource "azurerm_storage_queue" "q1" {
    
    name = "activacionusuarios"
    storage_account_name = azurerm_storage_account.saccount.name

}