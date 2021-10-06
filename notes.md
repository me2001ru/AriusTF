## Reference list
[diodonfrost/terraform-openstack-examples](https://github.com/diodonfrost/terraform-openstack-examples/tree/master/04-instance-with-loadbalancer)


# TODO:

* explore the described Aries setup
    - identify subnets and their layout (switches)
    - identify servers (aka instances)
    - identify security groups
    - known missing: dmz/external access
    - are changes neccessary?
        - discuss
        - document
        - execute

* split main.tf into parts
* normalize variable names
* normalize code style
    (mostly refering to) "${some.value}"


# Names
ref     network_dmz.id
var     var.network_dmz_name
real    "DMZ"

ports ?
interface ?
groups ?

# main -> parts
* Networks
    * Instances
    * Interfaces
    * Ports
* Security Groups
* Router

# changes
move DNS -> Hosting Network
remove Firewall
connect Router -> Ext
DMZ -> Create
WLAN -> Create
    - subnets for departments -> security groups

# Networks
Media
Hosting
WLAN
Departments
DMZ
