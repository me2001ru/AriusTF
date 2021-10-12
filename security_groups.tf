# Security Groups

# ###################################################################
#
# Webserver
#
# ###################################################################
resource "openstack_networking_secgroup_v2" "Webserver" {
  name                 = "Webserver"
  description          = "Allow http/https traffic to WebServer"
  delete_default_rules = true
}

# Http IPv4 in
resource "openstack_networking_secgroup_rule_v2" "Webserver_Rule_Inbound_HTTP_IPv4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.Webserver.id
}

# Https IPv4 in
resource "openstack_networking_secgroup_rule_v2" "Webserver_Rule_Inbound_HTTPS_IPv4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.Webserver.id
}

# Http IPv6 in
resource "openstack_networking_secgroup_rule_v2" "Webserver_Rule_Inbound_HTTP_IPv6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "::/0"
  security_group_id = openstack_networking_secgroup_v2.Webserver.id
}

# Https IPv6 in
resource "openstack_networking_secgroup_rule_v2" "Webserver_Rule_Inbound_HTTPS_IPv6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "::/0"
  security_group_id = openstack_networking_secgroup_v2.Webserver.id
}

# tcp IPv4 out
resource "openstack_networking_secgroup_rule_v2" "Webserver_Rule_Outbound_IPv4" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.Webserver.id
}

# tcp IPv6 out
resource "openstack_networking_secgroup_rule_v2" "Webserver_Rule_Outbound_IPv6" {
  direction         = "egress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  remote_ip_prefix  = "::/0"
  security_group_id = openstack_networking_secgroup_v2.Webserver.id
}


# ###################################################################
#
# InternallyManaged
#
# ###################################################################
resource "openstack_networking_secgroup_v2" "InternallyManaged" {
  name                 = "InternallyManaged"
  description          = "Allow SSH from Admin"
  delete_default_rules = true
}

# SSH in - from Admin
resource "openstack_networking_secgroup_rule_v2" "InternallyManaged_Rule_Inbound_SSH" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "192.168.4.2/32"
  security_group_id = openstack_networking_secgroup_v2.InternallyManaged.id
}

# tcp out - to admin
resource "openstack_networking_secgroup_rule_v2" "InternallyManaged_Rule_Outbound" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "192.168.4.2/32"
  security_group_id = openstack_networking_secgroup_v2.InternallyManaged.id
}


# ###################################################################
#
# Admin
#
# ###################################################################
resource "openstack_networking_secgroup_v2" "Admin" {
  name                 = "Admin"
  description          = "Allow SSH from anywhere"
  delete_default_rules = true
}

# SSH in - from Admin
resource "openstack_networking_secgroup_rule_v2" "Admin_Rule_Inbound_SSH" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0" # TODO 
  security_group_id = openstack_networking_secgroup_v2.Admin.id
}

# tcp out
resource "openstack_networking_secgroup_rule_v2" "Admin_Rule_Outbound_SSH" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "192.168.0.0/16"
  security_group_id = openstack_networking_secgroup_v2.Admin.id
}


# ###################################################################
#
# MySQL / Database
#
# ###################################################################
resource "openstack_networking_secgroup_v2" "Database" {
  name                 = "MySQL"
  description          = "Allow traffic to database from Webserver"
  delete_default_rules = true
}

# SQL in - from Webserver
resource "openstack_networking_secgroup_rule_v2" "Database_Rule_Inbound_SSH" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3306
  port_range_max    = 3306
  remote_ip_prefix  = "192.168.1.10/32"
  security_group_id = openstack_networking_secgroup_v2.Database.id
}

# tcp out - to webserver
resource "openstack_networking_secgroup_rule_v2" "Database_Rule_Outbound_Webserver" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "192.168.1.10/32"
  security_group_id = openstack_networking_secgroup_v2.Database.id
}


# ###################################################################
#
# NextCloud
#
# ###################################################################
resource "openstack_networking_secgroup_v2" "NextCloud" {
  name                 = "NextCloud"
  description          = "Allow tcp access from Wlan Subnet"
  delete_default_rules = true
}

# Http in
resource "openstack_networking_secgroup_rule_v2" "NextCloud_Rule_Inbound_HTTP" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "192.168.10.0/24"
  security_group_id = openstack_networking_secgroup_v2.NextCloud.id
}

# Https in
resource "openstack_networking_secgroup_rule_v2" "NextCloud_Rule_Inbound_HTTPS" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "192.168.10.0/24"
  security_group_id = openstack_networking_secgroup_v2.NextCloud.id
}

# tcp out
resource "openstack_networking_secgroup_rule_v2" "NextCloud_Rule_Outbound" {
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "192.168.10.0/24"
  security_group_id = openstack_networking_secgroup_v2.NextCloud.id
}
