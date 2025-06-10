resource "azurerm_container_registry" "acr" {
    
    # El nombre del Container Registry no puede tener caracteres especiales.
    # Es buena práctica manejar los nombres en minúscula
    # Todo el nombre tiene que ir pegado
    name = "acr${ lower(var.project) }${var.enviroment}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location

    /*
    El comando "admin_enabled" genera una conexión entre la webapp y el app service plan
    porque necesito conectar estos dos recursos, y necesito que el app service plan
    tenga que dar permisos administrativos para que la webapp pueda acceder también
    */
    admin_enabled = true 
    sku = "Basic"
    tags = var.tags
}