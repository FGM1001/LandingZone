##
#  Constructor de AVD pool para cliente ADIF
#
# Autor: fmingo@kabel.es


# Paso 1. Creación del resource group RG-AVD-SPK-02

resource "azurerm_resource_group" "RGAVDSPK02" {
  name = "RG-AVD-SPK-WE-02"
  location = local.location

  depends_on = [
    azurerm_virtual_network.vnethub
  ]

  tags = {
    Customer = "ADIF"
  }  

}


# Paso 2. Crear NSG. Se asocia al final del proceso
resource "azurerm_network_security_group" "avdnsgspk02"{
  name = "AVD-NSG-SPK-WE-02"
  location = local.location
  resource_group_name = azurerm_resource_group.RGAVDSPK02.name
  security_rule {
    name                        = "Allow_All_to_VPN"
    priority                    = "1001"
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "TCP"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "10.200.0.0/24"
    destination_address_prefix  = "*"
  }
    # Regla para permitir la conexion con Azure Active Directory Domain Services
    security_rule {
    name                        = "Allow_All_to_AADS"
    priority                    = "1002"
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "TCP"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "192.168.250.0/27"
    destination_address_prefix  = "*"
  }
      # Regla para bloquear el resto del trafico
    security_rule {
    name                        = "BlockAll"
    priority                    = "1100"
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "TCP"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }

  depends_on = [
    azurerm_resource_group.RGAVDSPK02
  ]

  tags = {
    Customer = "ADIF"
  }
}


# Paso 3. Crear Virtual Network del pool
resource "azurerm_virtual_network" "AVDVNETSPK02"{
    name = "AVD-VNET-SPK-WE-02"
    location = local.location
    resource_group_name = azurerm_resource_group.RGAVDSPK02.name
    address_space = ["192.168.101.0/26"]
    depends_on = [
        azurerm_resource_group.RGAVDSPK02
  ]

  tags = {
    Customer = "ADIF"
  }

}

# Paso 4. Crear Subnet
resource "azurerm_subnet" "snavdspk02" {
    name                 = "sn-avd-spk-02"
    resource_group_name  = azurerm_resource_group.RGAVDSPK02.name
    virtual_network_name = azurerm_virtual_network.AVDVNETSPK02.name
    address_prefixes       = ["192.168.101.0/26"]
    depends_on = [
        azurerm_virtual_network.AVDVNETSPK02
    ]

}

# Paso 5. Crear Peering entre red SPK01 y red HUB
resource "azurerm_virtual_network_peering" "hubtospk02" {
  name                  = "From-Hub-to-AVD-NET-SPK-02"
  resource_group_name   = azurerm_resource_group.RGAVDSPK02.name
  virtual_network_name  = azurerm_virtual_network.AVDVNETSPK02.name
  remote_virtual_network_id = azurerm_virtual_network.vnethub.id

  allow_virtual_network_access = true
  allow_forwarded_traffic     = true
  allow_gateway_transit       = false
  use_remote_gateways         = false

  depends_on = [
    azurerm_virtual_network.AVDVNETSPK02
  ]

}

# Paso 6. Crear Peering entre red HUB y red SPK02
resource "azurerm_virtual_network_peering" "skp02tohub" {
  name = "From_AVD_NET_SPK_02_to_HUB"
  resource_group_name = azurerm_resource_group.RGHUB.name
  virtual_network_name = azurerm_virtual_network.vnethub.name
  remote_virtual_network_id = azurerm_virtual_network.AVDVNETSPK02.id

  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = true
  use_remote_gateways = false

  depends_on = [
    azurerm_virtual_network.AVDVNETSPK02
  ]

}


# Paso 7. Crear tabla de rutas.
resource "azurerm_route_table" "avdrtspk02we" {
  name                          = "AVD-RT-SPK-WE-02"
  location                      = local.location
  resource_group_name           = azurerm_resource_group.RGAVDSPK02.name
  disable_bgp_route_propagation = true

  route {
    name            = "Internet"
    address_prefix  = "0.0.0.0/0"
    next_hop_type   = "VirtualAppliance"
    next_hop_in_ip_address = "192.168.250.4"
  }

  route{
    name            = "Client"
    address_prefix  = "10.230.0.0/16"
    next_hop_type   = "VirtualAppliance"
    next_hop_in_ip_address = "192.168.250.4"
  }

  depends_on = [
    azurerm_virtual_network.AVDVNETSPK02
  ]

  tags = {
    Customer = "ADIF"
  }
}


# Paso 8. Crear grupo en Azure AD que albergará a los usuarios del grupo

resource "azuread_group" "azadspk02"{
    display_name = "AVDUsers_Client_002"
    description = "Group of AVD users for Everis Aragon. Group 002"
}


# Paso 9. Asociar NSG a subred
resource "azurerm_subnet_network_security_group_association" "subnetnsg02" {
  subnet_id = azurerm_subnet.snavdspk02.id
  network_security_group_id = azurerm_network_security_group.avdnsgspk02.id

  depends_on = [
    azurerm_subnet.snavdspk02
  ]
}

# Paso 10. Asociar Route tabla a subnet
resource "azurerm_subnet_route_table_association" "routetable02" {
  subnet_id      = azurerm_subnet.snavdspk02.id
  route_table_id = azurerm_route_table.avdrtspk02we.id

  depends_on = [
    azurerm_subnet.snavdspk02
  ]
}