# Security Groups

# Allow HTTP(S) SG 
resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name        = "AllowHTTP(S)"
  description = "Allow http/https traffic to WebServer"

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

# SSH SG
resource "openstack_compute_secgroup_v2" "secgroup_2" {
  name        = "AllowSSH"
  description = "Allow SSH from everywhere"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
# Allow SSH from IT-server
resource "openstack_compute_secgroup_v2" "secgroup_3" {
  name        = "InternalSSH"
  description = "Allow SSH from IT-server"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0" 
  }
}

# MySQL SG
resource "openstack_compute_secgroup_v2" "secgroup_4" {
  name        = "AllowMySQL"
  description = "Allow traffic to database from Webserver"

  rule {
    from_port   = 3306
    to_port     = 3306
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

# Allow connection to NextCloud server 
resource "openstack_compute_secgroup_v2" "secgroup_5" {
  name        = "AllowWlan"
  description = "Allow traffic from Wlan"

  rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "192.168.10.0/24"
  }
  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "192.168.10.0/24"
  }
  
}