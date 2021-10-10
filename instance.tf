# Ports
resource "openstack_networking_port_v2" "port_nextcloud" {
  name                = "port_nextcloud"
  network_id          = "${openstack_networking_network_v2.network_media.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_media.id}"
    ip_address        = var.port_ip_nextcloud
  }
}

resource "openstack_networking_port_v2" "port_database" {
  name                = "port_database"
  network_id          = "${openstack_networking_network_v2.network_hosting.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_hosting.id}"
    ip_address        = var.port_ip_database
  }
}

resource "openstack_networking_port_v2" "port_conference" {
  name                = "port_conference"
  network_id          = "${openstack_networking_network_v2.network_department.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_department.id}"
    ip_address        = var.port_ip_conference
  }
}

# Instances
resource "openstack_compute_instance_v2" "instance_nextcloud" {
  name                = var.instance_name_nextcloud
  image_name          = var.image_name_ubuntu
  flavor_name         = var.flavor_name_mini
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}"]
  user_data           = var.cloudconfig_nextcloud

  network {
    port              = "${openstack_networking_port_v2.port_nextcloud.id}"
  }
}

resource "openstack_compute_instance_v2" "instance_database" {
  name                = var.instance_name_database
  image_name          = var.image_name_ubuntu
  flavor_name         = var.flavor_name_mini
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}"]
  user_data           = var.cloudconfig_database

  network {
    port              = "${openstack_networking_port_v2.port_database.id}"
  }
}

resource "openstack_compute_instance_v2" "instance_conference" {
  name                = var.instance_name_conference
  image_name          = var.image_name_ubuntu
  flavor_name         = var.flavor_name_mini
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}"]
  user_data           = var.cloudconfig_conference

  network {
    port              = "${openstack_networking_port_v2.port_conference.id}"
  }
}