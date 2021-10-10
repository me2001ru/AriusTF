## VARIABLES


# Router id
variable "router_id" {
  type    = string
  default = "600b8501-78cb-4155-9c9f-23dfcba88828"
}

# Networks
variable "network_name_dmz" {
  type    = string
  default = "DMZ-network"
}

variable "network_name_media" {
  type    = string
  default = "Media-network"
}

variable "network_name_hosting" {
  type    = string
  default = "Hosting-network"
}

variable "network_name_department" {
  type    = string
  default = "Department-network"
}

variable "network_name_wlan" {
  type    = string
  default = "WLAN-network"
}

#  DNS
variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.4.4"]
}

# Subnets
variable "subnet_name_dmz" {
  type    = string
  default = "DMZ-subnet"
}
variable "subnet_cidr_dmz" {
  type    = string
  default = "192.168.1.0/24"
}

variable "subnet_name_media" {
  type    = string
  default = "Media-subnet"
}
variable "subnet_cidr_media" {
  type    = string
  default = "192.168.2.0/24"
}

variable "subnet_name_hosting" {
  type    = string
  default = "Hosting-subnet"
}
variable "subnet_cidr_hosting" {
  type    = string
  default = "192.168.3.0/24"
}

variable "subnet_name_department" {
  type    = string
  default = "Department-subnet"
}
variable "subnet_cidr_department" {
  type    = string
  default = "192.168.4.0/24"
}

variable "subnet_name_wlan_media" {
  type    = string
  default = "Wlan_subnet_media"
}
variable "subnet_cidr_wlan_media" {
  type    = string
  default = "192.168.10.0/27"
}

variable "subnet_name_wlan_hosting" {
  type    = string
  default = "Wlan_subnet_hosting"
}
variable "subnet_cidr_wlan_hosting" {
  type    = string
  default = "192.168.10.32/27"
}

variable "subnet_name_wlan_department" {
  type    = string
  default = "Wlan_subnet_department"
}
variable "subnet_cidr_wlan_department" {
  type    = string
  default = "192.168.10.64/27"
}

# Instances
variable "instance_name_nextcloud" {
  type    = string
  default = "nextcloud"
}

variable "instance_name_database" {
  type    = string
  default = "database"
}

variable "instance_name_conference" {
  type    = string
  default = "conference"
}

# Images
variable "image_name_ubuntu" {
  type    = string
  default = "ubuntu-20.04-server-latest"
}

variable "flavor_name_mini" {
  type    = string
  default = "v1-mini-1"
}

variable "key_name" {
  type    = string
  default = "rasmus"
}

variable "key_value" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNzfi8sVQBv0AJzB92x4sPi4w4NtbB/ibHPvmHyGmhz3r+YVWpHetLm+Q09h/6abUR5uffPxuWyxpGsxDG5Mwn/80PGxN1EndTQbauAqVsliHPy1nXHbvyPACfZvehZUqZA+BEhIP9mBGBeqCkIpZlf5TU3NB58ucU/R5UITqC2LAMhxxFKBNTNQBsb9G8O8NQa8k3p+4a2fDwUXKcGVcb6CZqJX+EhkH1g9qv0vjAhCguY+azSQUGStwQJK7vxKHNfQSnLmZAsx+n4N956wT6OJdsd8nYsE7h0UDvUNM5FBz/4iEOxjDM3F7l5rX/NtiAPlS8t4qKS60Nm6rvjf01 Generated-by-Nova"
}

# Configuration
variable "cloudconfig_nextcloud" {
  type    = string
  default = <<EOF
#cloud-config
system_info:
  default_user:
    name: ubuntu
packages:
 - nextcloud
EOF
}

variable "cloudconfig_database" {
  type    = string
  default = <<EOF
#cloud-config
system_info:
  default_user:
    name: ubuntu
packages:
 - mysql
EOF
}

variable "cloudconfig_conference" {
  type    = string
  default = <<EOF
#cloud-config
system_info:
  default_user:
    name: ubuntu
EOF
}

# Ports
variable "port_ip_nextcloud" {
  type   = string
  default = "192.168.2.3"
}

variable "port_ip_database" {
  type   = string
  default = "192.168.3.3"
}

variable "port_ip_conference" {
  type   = string
  default = "192.168.4.3"
}
