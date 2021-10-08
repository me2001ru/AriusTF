/*  ## VARIABLES
# Make changes here

variable "network_name" {
  type    = string
  default = "Main-Network"
}
#First subnet details
variable "subnet_name" {
  type    = string
  default = "Network_subnet_1"
}
variable "subnet_cidr" {
  type    = string
  default = "192.168.1.0/24"
}
#Second subnet details
variable "subnet_name_2" {
  type    = string
  default = "Network_subnet_1"
}
variable "subnet_cidr_2" {
  type    = string
  default = "192.168.2.0/24"
}
#Third subnet details
variable "subnet_name_3" {
  type    = string
  default = "Network_subnet_1"
}
variable "subnet_cidr_3" {
  type    = string
  default = "192.168.3.0/24"
}
#Fourth subnet details
variable "subnet_name_4" {
  type    = string
  default = "Network_subnet_1"
}
variable "subnet_cidr_4" {
  type    = string
  default = "192.168.4.0/24"
}
# router id
variable "router_id" {
  type    = string
  default = "600b8501-78cb-4155-9c9f-23dfcba88828"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.4.4"]
}
*/

# router id
variable "external_gateway" {
  type    = string
  default = "600b8501-78cb-4155-9c9f-23dfcba88828"
}

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

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.4.4"]
}

#First subnet details
variable "dmz_subnet" {
  type    = string
  default = "Network_subnet_1"
}
variable "subnet_cidr_dmz" {
  type    = string
  default = "192.168.1.0/24"
}

variable "media_subnet" {
  type    = string
  default = "Network_subnet_1"
}
variable "subnet_cidr_media" {
  type    = string
  default = "192.168.2.0/24"
}

variable "hosting_subnet" {
  type    = string
  default = "Network_subnet_1"
}
variable "subnet_cidr_hosting" {
  type    = string
  default = "192.168.3.0/24"
}

variable "departments_subnet" {
  type    = string
  default = "Network_subnet_1"
}
variable "subnet_cidr_departments" {
  type    = string
  default = "192.168.4.0/24"
}

