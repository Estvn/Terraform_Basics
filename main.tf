# Aquí definimos nuestro proveedor de servicios 
provider "azurerm" { # Es mi proveedor de servicios. 
    subscription_id = var.subscription_id # Es mi número de suscripción. 
    features {}
}

# Aquí definí mi grupo de recursos en Azure para el proyecto 
resource "azurerm_resource_group" "rg" {  # rg es el nombre del objeto que identifica al grupo de recursos de mi cuenta. 
    name     = "rg-${ lower(var.project) }-${var.enviroment}" # Es el nombre de mi equipo de recursos ubicado en mi cuenta. 
    location = var.location

    # Tags y descripción/metadata del grupo de recursos 
    tags = var.tags
}