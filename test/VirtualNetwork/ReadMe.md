# Modulos Terraform para Azure Networking

Los siguientes módulos permite el despliegue de recursos de tipo 'Networking'.

## Virtual Network
El modulo crea un recurso tipo Virtual network en el resource group que se especifique.

### Variables de Entrada
Para configurar la VNET es necesario completar las siguientes variables:

|Variable           |Tipo   |Obligatoria    |Valor por Defecto  |Descripción                                                    |
|-------------------|:-----:|:-------------:|:-----------------:|:-------------------------------------------------------------:|
|Name               |String |No             |Autocompletada     |Se autocompleta automaticamente con variables de nomenclatura  |
|Azure_Location     |String |No             |westeurope         |Localización de los recursos.                                  |
|tags               |Object |Si             |                   |Etiquetas del recurso                                          |
|Company            |String |No             |wz                 |Nomenclatura: Compañia                                         |
|CloudProvider      |String |No             |az                 |Nomenclatura: Proveedor Cloud                                  |


### Variables de Salida