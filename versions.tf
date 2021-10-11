## INIT
# Define required providers
terraform {
  #backend "remote" {
  #    organization = "AriusTF"
  #    workspaces {
  #      name = "AriusTF"
  #    }
  #  }
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

