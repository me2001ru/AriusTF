# Create KeyPairs

resource "openstack_compute_keypair_v2" "ssh-key" {
  name       = var.key_name
  public_key = var.key_value
}
