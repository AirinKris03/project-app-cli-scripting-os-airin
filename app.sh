#!/bin/bash

# code warna ANSI
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# code warna background ANSI
RED_BG='\033[0;41m'
GREEN_BG='\033[0;42m'
CYAN_BG='\033[0;46m'
YELLOW_BG='\033[0;43m'
NC_BG='\033[0m' # No Color

# membuat function untuk menampilkan menu
function tampilkan_menu() {
  echo -e "${CYAN}=== Kalkulator Luas Bangun Datar ===${NC}"
  echo -e "${YELLOW}1. Persegi"
  echo -e "${YELLOW}2. Persegi Panjang"
  echo -e "${YELLOW}3. Lingkaran"
  echo -e "${YELLOW}4. Segitiga"
  echo "5. Keluar${NC}"
}

# membuat function pengecekan pilihan menu
if [ "$operasi" -eq 5 ]; then
  echo "Terima kasih sudah menggunakan Kalkulator Sederhana."
  exit 0
elif ! [[ "$operasi" =~ ^[1-4]$ ]]; then
  echo -e "${RED_BG}Pilihan tidak valid. Silakan masukkan angka antara 1 sampai 5."
  sleep 2
  continue
fi

# membuat function validasi inputan
function input_angka() {
  local prompt=$1
  local input

  while true; do
    read -p "$prompt" input
    if [[ -z "$input" ]]; then
      echo -e "${YELLOW_BG}Input tidak boleh kosong.${NC}"
    elif ! [[ "$input" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
      echo -e "${RED_BG}Input harus berupa angka.${NC}"
    else
      echo $input
      break
    fi
  done
}