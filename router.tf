# Create a router
resource "openstack_networking_router_v2" "router" {
  name                = "Magic_Box"
  admin_state_up      = "true"
  external_network_id = var.external_gateway # connects to external interface
}

