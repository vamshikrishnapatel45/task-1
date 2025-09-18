# Linux & Networking Cheatsheet

# Basic
pwd
ls -la
cd /path
cat file.txt

# Permissions
chmod 644 file.txt
chmod +x script.sh
chown user:group file

# Package
sudo apt update
sudo apt install -y package

# Networking
ip a
ifconfig -a
ping 192.168.56.102
netstat -tulnp
ss -tuln

# Nmap
sudo nmap -sS -sV -O <ip> -oN scan-results/s.txt
sudo nmap --top-ports 100 <ip>
sudo nmap -sV --script=http-enum <ip>

# Wireshark filters
http
ftp
dns
tcp.port == 21

# OpenSSL
openssl genpkey -algorithm RSA -out private.pem -pkeyopt rsa_keygen_bits:2048
openssl rsa -pubout -in private.pem -out public.pem

# Netcat
nc -lvnp 4444
