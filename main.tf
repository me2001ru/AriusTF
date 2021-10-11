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

