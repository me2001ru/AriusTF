#Create a router
resource "openstack_networking_router_v2" "router_1" {
  name                = "Magic_Box"
  admin_state_up      = "true"
  external_network_id = var.router_id # connects to external interface
}

