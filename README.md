# Konfigurasi IP

R1 Citra

1. hubungkan router ke internet menggunakan dhcp Client
   ip -> dhcp client -> + -> ether 1 -> klik Ok

apabila status bound berarti sudah terkoneksi

2. Tambahkan Ip address
   ip->addresses -> +
   ip 1, 192.168.1.1/24 -> Ether 2
   ip 2, 50.50.50.1/25 -> IPIP Tunnel

3. Buat Dhcp Server untuk Ether 2
   ip -> Dhcp Server -> Dhcp Setup -> Next hingga selesai

R2 KJ

1. hubungkan router ke internet menggunakan dhcp Client
   ip -> dhcp client -> + -> ether 1 -> klik Ok

apabila status bound berarti sudah terkoneksi

2. Tambahkan Ip address
   ip->addresses -> +
   ip 1, 192.168.2.1/24 -> Ether 2
   ip 2, 50.50.50.2/25 -> IPIP Tunnel
   IP 3, 60.60.60.1/25 -> IPIP Tunnel

3. Buat Dhcp Server untuk Ether 2
   ip -> Dhcp Server -> Dhcp Setup -> Next hingga selesai

R3 KHI

1. hubungkan router ke internet menggunakan dhcp Client
   ip -> dhcp client -> + -> ether 1 -> klik Ok

apabila status bound berarti sudah terkoneksi

2. Tambahkan Ip address
   ip->addresses -> +
   ip 1, 192.168.3.1/24 -> Ether 2
   ip 2, 60.60.60.2/25 -> IPIP Tunnel

3. Buat Dhcp Server untuk Ether 2
   ip -> Dhcp Server -> Dhcp Setup -> Next hingga selesai

# Konfigurasi IPIP
Routher 1 (CR)

Tambahkan interface ip tunnel 1
Local address : 159.168.10.1
Remote Address R2 : 159.168.10.2

Tambahkan interface ip tunnel 2
Local address : 159.168.10.1
Remote Address R2 : 159.168.20.2

Router 2 (KJ)

Tambahkan interface ip tunnel 1
Local address : 159.168.10.2
Remote Address R1 : 159.168.10.1

Tambahkan interface ip tunnel 2
Local address : 159.168.20.1
Remote Address R3: 159.168.20.2

Router 3 (KHI)

Tambahkan interface ip tunnel 1
Local address : 145.168.20.2
Remote Address R1 : 145.168.10.1

Tambahkan interface ip tunnel 2
Local address : 159.168.20.2
Remote Address R2: 159.168.20.1

# Konfigurasi routing
Router 2 (KJ)

routes 1:
destination address 192.168.2.0/24
gateway 50.50.50.2

routes 2:
destination address 192.168.3.0/24
gateway 60.60.60.2

Router 2 (KJ)

routes 1:
destination address 192.168.1.0/24
gateway 50.50.50.1

routes 2:
destination address 192.168.3.0/24
gateway 60.60.60.2

Router 3 (KHI)

routes 1:
destination address 192.168.1.0/24
gateway 50.50.50.1

routes 2:
destination address 192.168.2.0/24
gateway 60.60.60.1


#ANALISIS
1. Struktur Topologi
Topologi ini terdiri dari tiga router yang masing-masing berfungsi sebagai gateway untuk jaringan lokal (LAN). Setiap router terhubung ke internet melalui antarmuka Ethernet (ETH1) dan juga memiliki antarmuka lokal (E2) yang terhubung ke switch, menghubungkan beberapa perangkat dalam jaringan LAN.Router-router ini terhubung satu sama lain melalui tunnel IPIP (IP-in-IP), yang memungkinkan komunikasi antar jaringan lokal di setiap router melalui internet.

2. Fungsi Tunnel IPIP
Tunnel IPIP digunakan untuk memungkinkan komunikasi antara router-router di jaringan berbeda dengan melewati internet.
Dalam topologi ini, Tunnel IPIP dibuat antara:
R1 CR dan R2 KHI (50.50.50.1 <-> 50.50.50.2)
R2 KHI dan R3 KJ (60.60.60.1 <-> 60.60.60.2)
Dengan pengaturan ini, komunikasi antar LAN di R1, R2, dan R3 dapat dilakukan dengan rute statis yang mengarahkan data antar router melalui alamat IP tunnel masing-masing.

3. Pembagian Jaringan LAN
Jaringan di R1 CR: 192.168.1.0/24 dengan IP gateway 192.168.1.1
Jaringan di R2 KHI: 192.168.2.0/24 dengan IP gateway 192.168.2.1
Jaringan di R3 KJ: 192.168.3.0/24 dengan IP gateway 192.168.3.1

4. kesimpulan
Konfigurasi ini memungkinkan setiap router untuk berfungsi sebagai gateway bagi jaringan lokalnya masing-masing dan terhubung melalui IPIP tunnel untuk menghubungkan jaringan lokal antar router. Dengan konfigurasi routing yang tepat, perangkat di jaringan lokal R1, R2, dan R3 dapat saling berkomunikasi seolah-olah berada di jaringan yang sama, walaupun terhubung melalui internet.
