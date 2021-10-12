# Ports
resource "openstack_networking_port_v2" "port_nextcloud" {
  name               = var.port_name_nextcloud
  network_id         = openstack_networking_network_v2.network_media.id
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.SSH_internal.id}", "${openstack_networking_secgroup_v2.NextCloud.id}"]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_media.id
    ip_address = var.port_ip_nextcloud
  }
}

resource "openstack_networking_port_v2" "port_database" {
  name               = var.port_name_database
  network_id         = openstack_networking_network_v2.network_hosting.id
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.SSH_internal.id}", "${openstack_compute_secgroup_v2.MySQL.id}"]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_hosting.id
    ip_address = var.port_ip_database
  }
}

resource "openstack_networking_port_v2" "port_conference" {
  name               = var.port_name_conference
  network_id         = openstack_networking_network_v2.network_department.id
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.SSH_internal.id}"]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_department.id
    ip_address = var.port_ip_conference
  }
}

resource "openstack_networking_port_v2" "port_admin" {
  name               = var.port_name_admin
  network_id         = openstack_networking_network_v2.network_department.id
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.SSH_external.id}"]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_department.id
    ip_address = var.port_ip_admin
  }
}

resource "openstack_networking_port_v2" "port_webserver" {
  name               = var.port_name_webserver
  network_id         = openstack_networking_network_v2.network_dmz.id
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.webserver.id}", "${openstack_compute_secgroup_v2.SSH_internal.id}"]

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_dmz.id
    ip_address = var.port_webserver
  }
}

# Instances
resource "openstack_compute_instance_v2" "instance_nextcloud" {
  name            = var.instance_name_nextcloud
  image_name      = var.image_name_ubuntu
  flavor_name     = var.flavor_name_mini
  key_pair        = var.key_name
  security_groups = ["${openstack_compute_secgroup_v2.SSH_internal.name}", "${openstack_compute_secgroup_v2.NextCloud.name}"]
  user_data       = var.cloudconfig_nextcloud

  network {
    port = openstack_networking_port_v2.port_nextcloud.id
  }
}

resource "openstack_compute_instance_v2" "instance_database" {
  name            = var.instance_name_database
  image_name      = var.image_name_ubuntu
  flavor_name     = var.flavor_name_mini
  key_pair        = var.key_name
  security_groups = ["${openstack_compute_secgroup_v2.SSH_internal.name}", "${openstack_compute_secgroup_v2.MySQL.name}"]
  user_data       = var.cloudconfig_database

  network {
    port = openstack_networking_port_v2.port_database.id
  }
}

resource "openstack_compute_instance_v2" "instance_admin" {
  name        = var.instance_name_admin
  image_name  = var.image_name_ubuntu
  flavor_name = var.flavor_name_mini
  key_pair    = var.key_name

  security_groups = ["${openstack_compute_secgroup_v2.SSH_external.name}"]
  user_data       = var.cloudconfig_admin

  network {
    port = openstack_networking_port_v2.port_admin.id
  }
}

resource "openstack_compute_instance_v2" "instance_webserver" {
  name        = var.instance_name_webserver
  image_name  = var.image_name_ubuntu
  flavor_name = var.flavor_name_mini
  key_pair    = var.key_name

  security_groups = ["${openstack_compute_secgroup_v2.SSH_internal.name}", "${openstack_compute_secgroup_v2.webserver.name}"]
  user_data       = var.cloudconfig_webserver

  network {
    port = openstack_networking_port_v2.port_webserver.id
  }
}

resource "openstack_compute_instance_v2" "instance_conference" {
  name            = var.instance_name_conference
  image_name      = var.image_name_ubuntu
  flavor_name     = var.flavor_name_mini
  key_pair        = var.key_name
  security_groups = ["${openstack_compute_secgroup_v2.SSH_internal.name}"]
  user_data       = var.cloudconfig_conference

  network {
    port = openstack_networking_port_v2.port_conference.id
  }
}
