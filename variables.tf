# Aquí ingresamos las variables que probablemente se utilicen en varios archivos. 
variable "subscription_id" {
  type        = string
  description = "My Azure ID suscription"
}

variable "location" {
    type = string
    description = "Location of the project"
    default = "Central US"
}

variable "project" {
    type = string
    description = "Project's name"
    default = "cafeteriaunah"
}

variable "enviroment" {
    type = string
    description = "enviroment type"
    default = "env"
}

variable "tags" {
    type = map(string) # Este es un valor de tipo mapas de strings 
    description = "A map with all the tags"
    default = {
        enviroment = "development"
        date = "2025-06-08"
        createdBy = "Estiven Mejía"
    }
}

variable "admin_sql_password" {
    type = string
    description = "SQL Admin Password"
}