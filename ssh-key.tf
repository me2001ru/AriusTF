# Defining ssh to config in instance

resource "openstack_compute_keypair_v2" "user_key" {
  name       = "user-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG2w+ksChepHFJd7BXT8wTQIhGAAzkF2qnosIx7OSIBZXUedmBHhLYNoANxrn5tT9y2U+JZYgqvdpzbzOxXysmcSvsMDr+2lfV8pWwTGtOsLFjVZJyRaW150vrrFoRVICQvzK4oF5y3JKJLDmdb9INBHQZwpwzu3//CPUw6FrqYjOU0N5smB279fV3fpCnXgBKkZFdzM9dfxEzuVsJtO3GIt2eQg1sde1sE9IJqH9pt3P50bzIaOv/8TDAJ3j4jmpx2i1i6yNFZKArTVJfdOC+e0iF+AOQVwsWmkwaDMalHZ9TpwcV4UmNp9sjpmu3OkEMtXyIcOjPJY6p33zg7uYX"
}

# Public Key Generated-by-Nova
