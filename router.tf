# Router
resource "openstack_networking_router_v2" "router" {
  name                = "Magic_Box"
  admin_state_up      = "true"
  external_network_id = var.router_id # connects to external interface
}