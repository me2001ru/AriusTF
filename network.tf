# 1. Networks
# 2. Subnets
# 3. Router <-> Subnet Interfaces

# Create Networks
resource "openstack_networking_network_v2" "network_dmz" {
  name           = var.network_name_dmz
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "network_media" {
  name           = var.network_name_media
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "network_hosting" {
  name           = var.network_name_hosting
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "network_department" {
  name           = var.network_name_department
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "network_wlan" {
  name           = var.network_name_wlan
  admin_state_up = "true"
}

# Create Subnets
resource "openstack_networking_subnet_v2" "subnet_dmz" {
  name            = var.subnet_name_dmz
  network_id      = openstack_networking_network_v2.network_dmz.id
  cidr            = var.subnet_cidr_dmz
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_subnet_v2" "subnet_media" {
  name            = var.subnet_name_media
  network_id      = openstack_networking_network_v2.network_media.id
  cidr            = var.subnet_cidr_media
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_subnet_v2" "subnet_hosting" {
  name            = var.subnet_name_departments
  network_id      = openstack_networking_network_v2.network_departments.id
  cidr            = var.subnet_cidr_hosting
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_subnet_v2" "subnet_departments" {
  name            = var.subnet_name_hosting
  network_id      = openstack_networking_network_v2.network_hosting.id
  cidr            = var.subnet_cidr_departments
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

# Create Interfaces
resource "openstack_networking_router_interface_v2" "router_interface_dmz" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet_dmz.id
}

resource "openstack_networking_router_interface_v2" "router_interface_media" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet_media.id
}

resource "openstack_networking_router_interface_v2" "router_interface_departments" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet_departments.id
}

resource "openstack_networking_router_interface_v2" "router_interface_hosting" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet_hosting.id
}
