# Create network
resource "openstack_networking_network_v2" "DMZ" {
  name           = var.network_name_dmz
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "Media" {
  name           = var.network_name_media
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "Hosting" {
  name           = var.network_name_hosting
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "Departments" {
  name           = var.network_name_department
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "Wlan" {
  name           = var.network_name_wlan
  admin_state_up = "true"
}

# Create subnets
resource "openstack_networking_subnet_v2" "dmz_subnet" {
  name            = var.dmz_subnet
  network_id      = openstack_networking_network_v2.DMZ.id
  cidr            = var.subnet_cidr_dmz
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

#routers first interface connected to dmz_subnet
resource "openstack_networking_router_interface_v2" "router_interface_dmz" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.dmz_subnet.id
}

resource "openstack_networking_subnet_v2" "media_subnet" {
  name            = var.media_subnet
  network_id      = openstack_networking_network_v2.Media.id
  cidr            = var.subnet_cidr_media
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

#routers first interface connected to dmz_subnet
resource "openstack_networking_router_interface_v2" "router_interface_media" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.media_subnet.id
}

resource "openstack_networking_subnet_v2" "hosting_subnet" {
  name            = var.hosting_subnet
  network_id      = openstack_networking_network_v2.Hosting.id
  cidr            = var.subnet_cidr_hosting
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

#routers first interface connected to dmz_subnet
resource "openstack_networking_router_interface_v2" "router_interface_hosting" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.hosting_subnet.id
}

resource "openstack_networking_subnet_v2" "departments_subnet" {
  name            = var.departments_subnet
  network_id      = openstack_networking_network_v2.Departments.id
  cidr            = var.subnet_cidr_departments
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

#routers first interface connected to dmz_subnet
resource "openstack_networking_router_interface_v2" "router_interface_departments" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.departments_subnet.id
}