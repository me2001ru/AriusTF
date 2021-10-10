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


# SSH Key
variable "key_name" {
  type    = string
  default = "cb-key"
}

variable "key_public" {
  type    = string

  # Zephyro's key
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtgFcP+fiDOSdynaL2meiAp9GUvvzCgjpXBhjiVDj6OrG3ShAPUMCxkGrUG8nq1IrFCFbCjSzcopymykXikwUxvnAi0PVskO70XulMjWc/PKBtrD0Yhuh8w4yHjs3ZXUL1cOOq2NTaejiWcT7h7gy0N+fWBUo3TI/Y7qqkGHQ/Y0trficbqb4kEcLx0lzK3RB4hlqpj0kBXS/s7BKtUqxrD6kUH4wxT8w8bHMI4fmT8UHl3dX/wilOW/9wFyrrgYFs+g+Ta+Igi2KpTqO8rxBXSA5Js538kS9Hxh3MZVnige+Zs4yZU98et8/W+YJl5lkktbEj97/gX2puAW0jPs78l4LiK0LkXwvVL6RRKXw0M6/IC00UMPMSstN4cImAEbKwXfd6/ZiJG+m2MdQMR6lcSbtUA8XkkOHHHnyOd9OQ+NUl1oJ0xiQFsi2o0rsYrZysdXxYnbFdojDe4tBKMG31HDfoWGELo9tEAfGez2mOwKBwc8+BrO0iuxvMAgnPaBs= Zephyro@Zephyros-MBP"

  # Placeholders for others
  # default = ""
  # default = ""
  # default = ""
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
  type    = string
  default = "192.168.2.3"
}

variable "port_ip_database" {
  type    = string
  default = "192.168.3.3"
}

variable "port_ip_conference" {
  type    = string
  default = "192.168.4.3"
}

