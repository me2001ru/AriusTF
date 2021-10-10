# Create Servers (instances)
# Make this work with YAML-file
# variable "image" {
# default = "Ubuntu 14.04"
# }

# variable "flavor" {
# default = "m1.small"
# }

###########################

# variable "pool" {
# default = "public"
# }

# resource "openstack_compute_floatingip_v2" "terraform" {
# pool = "${var.pool}"
# depends_on = ["openstack_networking_router_interface_v2.terraform"]
# }
###########################
###########################


# resource "openstack_compute_instance_v2" "terraform" {
# name = "terraform"
# image_name = "${var.image}"
# flavor_name = "${var.flavor}"
# key_pair = "${openstack_compute_keypair_v2.terraform.name}"
# security_groups = [ "${openstack_compute_secgroup_v2.terraform.name}" ]
# floating_ip = "${openstack_compute_floatingip_v2.terraform.address}"

# network {
# uuid = "${openstack_networking_network_v2.terraform.id}"
# }

# provisioner "remote-exec" {
# connection {
# user = "${var.ssh_user_name}"
# key_file = "${var.ssh_key_file}"
# }

# # what to run on the instance: 
# inline = [
# "sudo apt-get -y update",
# "sudo apt-get -y install nginx",
# "sudo service nginx start"
# ]
# }
# }

# output "address" {
# value = "${openstack_compute_floatingip_v2.terraform.address}"
# }


#Database server

# resource "openstack_db_instance_v1" "test" {
#   region    = "region-test"
#   name      = "test"
#   flavor_id = "31792d21-c355-4587-9290-56c1ed0ca376"
#   size      = 8

#   network {
#     uuid = "c0612505-caf2-4fb0-b7cb-56a0240a2b12"
#   }

#   datastore {
#     version = "mysql-5.7"
#     type    = "mysql"
#   }
# }
