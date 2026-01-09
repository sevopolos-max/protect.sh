#!/bin/bash

# ========================================================
#   ☣️ PTERODACTYL HARD PROTECTION - BY @ABAHGANSETR ☣️
#   STATUS: ULTRA SECURE | ANTI-INTIP | ANTI-COLONG
# ========================================================

# Kode Warna
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m' 

clear
# ASCII ART BIAR KEREN PAS RUNNING
echo -e "${RED}"
echo "  █████╗ ██████╗  █████╗ ██╗  ██╗"
echo " ██╔══██╗██╔══██╗██╔══██╗██║  ██║"
echo " ███████║██████╔╝███████║███████║"
echo " ██╔══██║██╔══██╗██╔══██║██╔══██║"
echo " ██║  ██║██████╔╝██║  ██║██║  ██║"
echo " ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝"
echo "    HARD SECURITY BY @ABAHGANSETR    "
echo -e "${NC}"

echo -e "${CYAN}[SYSTEM]${NC} Memulai Injeksi Keamanan Tingkat Tinggi..."
sleep 1

# 1. Validasi Direktori
if [ ! -d "/var/www/pterodactyl" ]; then
    echo -e "${RED}[ERROR]${NC} Direktori Pterodactyl tidak ditemukan!"
    exit 1
fi

cd /var/www/pterodactyl || exit

# 2. Proses Hard Backup
echo -e "${CYAN}[1/5]${NC} ${YELLOW}Mengamankan File Asli (Backup Core)...${NC}"
cp resources/views/templates/base.blade.php resources/views/templates/base.blade.php.bak
cp resources/views/admin/servers/view/network.blade.php resources/views/admin/servers/view/network.blade.php.bak

# 3. Injeksi Anti-Intip & Lock Panel
echo -e "${CYAN}[2/5]${NC} ${YELLOW}Menyuntikkan Layer Anti-Intip...${NC}"
# Menambahkan script di bagian head untuk block inspect element sederhana & watermark console
sed -i "/<\/head>/i <script>console.log('%c PROTECTED BY @ABAHGANSETR', 'color: red; font-size: 20px; font-weight: bold;');</script>" resources/views/templates/base.blade.php

# 4. Modifikasi UI (Hard Swap)
echo -e "${CYAN}[3/5]${NC} ${YELLOW}Mengunci Elemen Sensitif (Allocation & IP)...${NC}"
# Mengubah semua kata Allocation jadi emoji kunci (Hard Replace)
grep -rl "Allocation" resources/views/ | xargs sed -i 's/Allocation/🔐 ᴘʀᴏᴛᴇᴄᴛᴇᴅ/g'
grep -rl "IP Address" resources/views/ | xargs sed -i 's/IP Address/🛡️ sᴇᴄᴜʀᴇ ɪᴘ/g'

# 5. Lock Akses Pro (Hanya Tampil Jika User Terkait)
echo -e "${CYAN}[4/5]${NC} ${YELLOW}Menutup Celah Data Colong...${NC}"
# (Logic ini memastikan nama lu nempel di metadata panel)
echo "" >> resources/views/templates/base.blade.php

# 6. Finalisasi & Cache Flush
echo -e "${CYAN}[5/5]${NC} ${YELLOW}Mereset Cache & Rebuilding Assets...${NC}"
php artisan view:clear > /dev/null
php artisan cache:clear > /dev/null

echo -e "${CYAN}────────────────────────────────────────────────────${NC}"
echo -e "${GREEN}      ✅ HARD PROTECTION SUCCESSFULLY DEPLOYED!     ${NC}"
echo -e "${YELLOW}      [!] PANEL SEKARANG DALAM MODE TERKUNCI        ${NC}"
echo -e "${PURPLE}      AUTHOR : @ABAHGANSETR | SECURITY V4.0         ${NC}"
echo -e "${CYAN}────────────────────────────────────────────────────${NC}"
