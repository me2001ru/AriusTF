# Create a port
resource "openstack_networking_port_v2" "port_1" {
  name                = "port_1"
  network_id          = "${openstack_networking_network_v2.network_media.id}"
  admin_state_up      = "true"
  security_group_ids  = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id         = "${openstack_networking_subnet_v2.subnet_media.id}"
    ip_address        = var.port_ip_nextcloud
  }
}
## INSTANCE
# Create an instance
resource "openstack_compute_instance_v2" "instance_nextcloud" {
  name                = var.instance_name_nextcloud
  image_name          = var.image_name_ubuntu
  flavor_name         = var.flavor_name_mini
  key_pair            = var.key_name
  security_groups     = ["default","${openstack_compute_secgroup_v2.secgroup_1.name}","${openstack_compute_secgroup_v2.secgroup_2.name}"]
  user_data           = var.cloudconfig_web

  network {
    port              = "${openstack_networking_port_v2.port_1.id}"
  }
}

