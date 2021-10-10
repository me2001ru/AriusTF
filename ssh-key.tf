# Create KeyPairs

resource "openstack_compute_keypair_v2" "ssh-key" {
  name       = var.key_name
  public_key = var.key_public
}

# resource "openstack_compute_keypair_v2" "key4" {
#   name       = "key4"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC21PyfegA8FmeIr8sefDukv+wt1pjj0Xuitrewzt+oYF+0DlhlGazfvg3gt6667K2l6eA4ZXkX/wq5QrZUSzxbRJN49nGhADZzOudEHJfezL/ZlObsNW/f8SsXWA59Knzy0oP4KtdatZVi5ua0tBhCmanl3Hxgct0Nuao2/x39W5ykP5/29Hmfq2JF3KQJMnMAKFPGazvrMXSx6brLK3YZrXQ2eOGDSSuzAqISKElpjzA1mH3Gmfwcs5s4ThKUc+ESWEoex4eZiemdLP70mVeP6iBSqGrhoc3zTRH6sjttrATYFSoI1DffzO2HEP8Qv8po+cSqVgK4B5lXFJ0sB7sBy9vp605dpoQhQpmmOvyL/8Rt7kGxyVKkijizjXwCxw64+v3LG5Xt9E+j+kmi5aUX59ICX1b2HLTUzigBjKY6J9a/FUNfxXhH9TkfuFKNWvQEmRa2McpbwFevmecoCf8N2cINig8ypLkqIPoruGbfbOi273tQh5UkyevCotjSWped107vDOfTParRPSNo8R0wLIpHCiYEIUEko4tCNdAtDJtSxmYd04xGPAyLi31SvR4w6yxsQZFuvW1J2Q4qo5uROslo7NRi+KX9MEolVPcJaSy8i5pd4YckKdtD59LCnveZNu/Sbbr6+iz/5xHl/FtksRxme/99aOOcC1crfRVNJQ"
# }
