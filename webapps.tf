# Creación del servicio
resource "azurerm_service_plan" "sp" {
  name                = "sp-${var.project}-${var.enviroment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  
  os_type             = "Linux"  
  sku_name            = "B1"    
  tags = var.tags
}

# Creación de la webapp y vinculación con el servicio creado
resource "azurerm_linux_web_app" "webappui" {
    name = "ui-${var.project}-${var.enviroment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.sp.id # Referenciamos la webapp con el ID del servicio

    # Configuración de la App Web
    site_config {
        always_on = true # Queremos la apicación siempre levantada

        # Vamos a definir a Docker como el stack utulizado en este servidor       
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }

    # Aquí definimos las variables de entorno que definimos al momento de crear nuestra aplicación
    app_settings = {
        WEBSITES_PORT = "80" # El puerto del servidor donde correrá la aplicación
    }

    tags = var.tags
}

# Creación de la webapp y vinculación con el servicio creado
resource "azurerm_linux_web_app" "webappapi" {
    name = "api-${var.project}-${var.enviroment}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.sp.id # Referenciamos la webapp con el ID del servicio

    # Configuración de la App Web
    site_config {
        always_on = true # Queremos la apicación siempre levantada

        # Vamos a definir a Docker como el stack utulizado en este servidor       
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }

    # Aquí definimos las variables de entorno que definimos al momento de crear nuestra aplicación
    app_settings = {
        WEBSITES_PORT = "80" # El puerto del servidor donde correrá la aplicación
    }

    tags = var.tags
}