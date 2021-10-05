## PROVIDER
# Configure the OpenStack Provider
provider "openstack" {
  #user_name          = "" # use $OS_USERNAME
  #tenant_name        = "" # use $OS_PROJECT_NAME
  #tenant_id          = "" # use $OS_PROJECT_ID
  #password           = "" # use $OS_PASSWORD
  #auth_url           = "" # use $OS_AUTH_URL
  #region             = "" # use $OS_REGION_NAME
}

# Create network
resource "openstack_networking_network_v2" "network_1" {
  name           = var.network_name
  admin_state_up = "true"
}

# Create subnets
resource "openstack_networking_subnet_v2" "subnet_1" {
  name            = var.subnet_name
  network_id      = openstack_networking_network_v2.network_1.id
  cidr            = var.subnet_cidr
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_subnet_v2" "subnet_2" {
  name            = var.subnet_name_2
  network_id      = openstack_networking_network_v2.network_1.id
  cidr            = var.subnet_cidr_2
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_subnet_v2" "subnet_3" {
  name            = var.subnet_name_3
  network_id      = openstack_networking_network_v2.network_1.id
  cidr            = var.subnet_cidr_3
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

resource "openstack_networking_subnet_v2" "subnet_4" {
  name            = var.subnet_name_4
  network_id      = openstack_networking_network_v2.network_1.id
  cidr            = var.subnet_cidr_4
  ip_version      = 4
  dns_nameservers = var.dns_ip
}

#Set port

#Set Security-group
resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name        = "TerraformHTTP(S)"
  description = "Set Port http and https"

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "secgroup_2" {
  name        = "TerraformSSH"
  description = "SSH "

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0" # change this to appropriate allowed ip's.
  }
}

#Create a router
resource "openstack_networking_router_v2" "router_1" {
  name                = "Magic_Box"
  admin_state_up      = "true"
  external_network_id = "600b8501-78cb-4155-9c9f-23dfcba88828" # connects to external interface
}

#routers first interface connected to subnet_1
resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_1.id
}

#routers second interface connected to subnet_2
resource "openstack_networking_router_interface_v2" "router_interface_2" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_2.id
}

#routers third interface connected to subnet_3
resource "openstack_networking_router_interface_v2" "router_interface_3" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_3.id
}

#routers fourth interface connected to subnet_4
resource "openstack_networking_router_interface_v2" "router_interface_4" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_4.id
}
