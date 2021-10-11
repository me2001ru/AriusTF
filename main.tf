
# Security Groups
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

