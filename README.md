PENJELASAN STUDI KASUS IP ROUTING CR,KHI,KJ


# Set ip setiap router
Router 1 (CR) <br>
Ethernet 2: 192.168.10.1/24 <br>
Ethernet 3: 15.15.15.1/24 <br>
Ethernet 4: 16.16.16.1/24
 
Router 2 (KJ) <br>
Ethernet 2: 192.168.20.1/24 <br>
Ethernet 3: 15.15.15.2/24 <br>
Ethernet 4: 17.17.17.1/24

Router 3 (KHI) <br>
Ethernet 2: 192.168.30.1/24 <br>
Ethernet 3: 16.16.16.2/24 <br>
Ethernet 4: 17.17.17.2/24

# Lakukan DHCP Server setiap router
Router 1 (CR) <br>
DHCP Server -> Ethernet 2

Router 2 (KJ) <br>
DHCP Server -> Ethernet 2

Router 3 (KHI) <br>
DHCP Server -> Ethernet 2

# Set Interface Routing RIP
Router 1 (CR) <br>
Tambahkan Interface all | Receive v1-2 | Send v2 <br>

Router 2 (KJ) <br>
Tambahkan Interface all | Receive v1-2 | Send v2 <br>

Router 3 (KHI) <br>
Tambahkan Interface all | Receive v1-2 | Send v2 <br>

# Set Network Routing RIP
Router 1 (CR) <br>
Tambahkan network: <br>
192.168.10.0 <br>
15.15.15.0 <br>
16.16.16.0

Router 2 (KJ) <br>
Tambahkan network: <br>
192.168.20.0 <br>
15.15.15.0 <br>
17.17.17.0

Router 3 (KHI) <br>
Tambahkan network: <br>
192.168.30.0 <br>
16.16.16.0 <br>
17.17.17.0

# Set Neighbour Routing RIP
Router 1 (CR) <br>
Tambahkan neighbour: <br>
15.15.15.1 <br>
17.17.17.1

Router 2 (KJ) <br>
Tambahkan neighbour: <br>
15.15.15.2 <br>
16.16.16.2

Router 3 (KHI) <br>
Tambahkan neighbour: <br>
17.17.17.2 <br> 
16.16.16.1
