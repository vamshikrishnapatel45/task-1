A. Preliminaries — what you need

Host machine (Windows / macOS / Linux) with virtualization support (VT-x/AMD-V enabled in BIOS).

VirtualBox (latest) installed on host.

~20–40 GB free disk and ≥4 GB RAM recommended.

Downloads: Kali Linux (VM image or ISO), Metasploitable2 (OVF), optional DVWA (web app).

B. Download Kali (two options)
Option 1 — Quick: Prebuilt VirtualBox image (recommended)

Go to the official Kali downloads page and download the VirtualBox VM image.

Verify checksums/signatures if provided (recommended).

Option 2 — Install from ISO (if you want a custom install)

Download Kali Installer ISO from official site.

Verify checksum/signature.

(You can verify SHA256 on Linux/macOS/PowerShell with sha256sum <file> / Get-FileHash -Algorithm SHA256 <file>.)

C. Install VirtualBox (if not already)

Download VirtualBox from virtualbox.org and install.

Optional: install VirtualBox Extension Pack for USB and other features.

D. Import / Create VMs
D1 — Import prebuilt Kali VM (VirtualBox)

Open VirtualBox → File → Import Appliance... → select downloaded .ova or .ovf → Next → Import.

After import, select the VM → Settings → System → give 2–4 GB RAM (4 GB recommended).

Settings → Network:

Adapter 1: Host-only Adapter (choose vboxnet0 or create one in Host Network Manager).

Optional: Adapter 2: NAT if you want host internet for updates.

Settings → Display → Video Memory 128 MB.

Start the VM and log in (default credentials for prebuilt images: check Kali docs; usually kali:kali or rootless user). Immediately change any default password.

D2 — Create Kali VM from ISO (manual install)

New → Name Kali → Type Linux → Version Debian (64-bit) → Memory 4096 MB → Create VDI dynamically allocated 20+ GB.

Settings → Storage → attach Kali ISO to IDE/SATA controller.

Boot VM and follow installer prompts (choose username, password). After install, remove ISO and reboot.

E. Create Host-Only Network (isolated lab)

VirtualBox → File → Host Network Manager → Create.

Note the Host-Only network IP (e.g., 192.168.56.1). VMs using Host-Only will get addresses like 192.168.56.101, 102 etc.

In each VM Settings → Network → set Adapter to this Host-Only network.

F. Import Metasploitable2 (target VM)

Download Metasploitable2 (prebuilt VM).

VirtualBox → File → Import Appliance... → select Metasploitable2 .ova → Import.

Settings → Network → attach to same Host-Only network as Kali.

Start VM; default credentials: msfadmin:msfadmin. (Document this in repo.)

G. (Optional) Install DVWA on a target VM

If you prefer DVWA as a web target (install on an Ubuntu VM):

Create Ubuntu VM and attach to Host-Only network.

Install LAMP stack and DVWA:

sudo apt update && sudo apt install -y apache2 mysql-server php php-mysqli git
cd /var/www/html
sudo git clone https://github.com/digininja/DVWA.git dvwa
sudo chown -R www-data:www-data dvwa
# create DB and configure DVWA as per its README


Document the URL: http://<dvwa-ip>/dvwa.

H. First steps inside Kali — hardening & utilities

Update & upgrade:

sudo apt update && sudo apt upgrade -y


Create a non-root user (if not already):

sudo adduser dhonthula
sudo usermod -aG sudo dhonthula



Install Guest Additions if needed (for clipboard/window resizing) — use VirtualBox menu Devices → Insert Guest Additions CD image and follow instructions.
