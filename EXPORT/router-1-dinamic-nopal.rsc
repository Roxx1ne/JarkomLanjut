# jan/02/1970 00:43:35 by RouterOS 6.48.6
# software id = PQMT-7BFQ
#
# model = RB941-2nD
# serial number = HDJ08PVRQPJ
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
add name=dhcp_pool1 ranges=192.168.2.2-192.168.2.254
add name=dhcp_pool2 ranges=192.168.3.2-192.168.3.254
add name=dhcp_pool3 ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool4 ranges=192.168.20.2-192.168.20.254
add name=dhcp_pool5 ranges=192.168.10.2-192.168.10.254
/ip dhcp-server
add address-pool=dhcp_pool5 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.10.1/24 interface=ether2 network=192.168.10.0
add address=15.15.15.1/24 interface=ether3 network=15.15.15.0
add address=16.16.16.1/24 interface=ether4 network=16.16.16.0
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
add address=192.168.2.0/24 gateway=192.168.2.1
add address=192.168.3.0/24 gateway=192.168.3.1
add address=192.168.10.0/24 gateway=192.168.10.1
add address=192.168.20.0/24 gateway=192.168.20.1
/routing rip interface
add
/routing rip neighbor
add address=15.15.15.2
add address=16.16.16.2
/routing rip network
add network=16.16.16.0/24
add network=15.15.15.0/24
add network=192.168.10.0/24
/system identity
set name="Router 1 (CR)"
