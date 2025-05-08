#!/bin/bash

# code warna ANSI
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# membuat function untuk menampilkan menu
function tampilkan_menu() {
  echo -e "${CYAN}=== Penghitung Luas Bangun Datar ===${NC}"
  echo -e "${YELLOW}1. Persegi"
  echo -e "${YELLOW}2. Persegi Panjang"
  echo -e "${YELLOW}3. Lingkaran"
  echo -e "${YELLOW}4. Segitiga"
  echo "5. Keluar"
}

# membuat function pengecekan pilihan menu
if [[ ! "$pilihan" =~ ^[0-9]+$ ]]; then
  echo -e "${RED}Pilihan tidak valid. Masukkan angka antara 1 sampai 5.${NC}"
  sleep 2
  continue
elif [ "$pilihan" -eq 5 ]; then
  echo "Terima kasih sudah menggunakan Penghitung Luas Bangun Datar."
  exit 0
elif [[ ! "$pilihan" =~ ^[1-4]$ ]]; then
  echo -e "${RED}Pilihan tidak valid. Silakan masukkan angka antara 1 sampai 5.${NC}"
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
      echo -e "${RED}Input harus berupa angka.${NC}"
    else
      echo $input
      break
    fi
  done
}

# membuat function untuk menghitung luas persegi
function luas_persegi() {
  local sisi=$1
  local luas=$(( sisi * sisi ))
  echo -e "${GREEN}Luas persegi dengan sisi $sisi adalah $luas"
}

# membuat function untuk menghitung luas persegi panjang
function luas_persegi_panjang() {
  local panjang=$1
  local lebar=$2
  local luas=$(( panjang * lebar ))
  echo -e "${GREEN}Luas persegi panjang dengan panjang $panjang dan lebar $lebar adalah $luas"
}

# membuat function untuk menghitung luas lingkaran
function luas_lingkaran() {
  local jari_jari=$1
  local luas=$(echo "3.14 * ($jari_jari ^ 2)" | bc)
  echo -e "${GREEN}Luas lingkaran dengan jari-jari $jari_jari adalah $luas"
}

# membuat function untuk menghitung luas segitiga
function luas_segitiga() {
  local alas=$1
  local tinggi=$2
  local luas=$(( alas * tinggi / 2 ))
  echo -e "${GREEN}Luas segitiga dengan alas $alas dan tinggi $tinggi adalah $luas"
}

# perulangan utama (main loop)
while true; do
clear
  tampilkan_menu
  echo
  read -p "Pilih bangun datar yang ingin Kamu ketahui luasnya: " pilihan

  case $pilihan in
    1)
      echo -e "${CYAN}=== Menghitung Luas Persegi ===${NC}"
      sisi=$(input_angka "Masukkan sisi persegi: ")
      luas_persegi $sisi
      ;;
    2)
      echo -e "${CYAN}=== Menghitung Luas Persegi Panjang ===${NC}"
      panjang=$(input_angka "Masukkan panjang persegi panjang: ")
      lebar=$(input_angka "Masukkan lebar persegi panjang: ")
      luas_persegi_panjang $panjang $lebar
      ;;
    3)
      echo -e "${CYAN}=== Menghitung Luas Lingkaran ===${NC}"
      jari_jari=$(input_angka "Masukkan jari-jari lingkaran: ")
      luas_lingkaran $jari_jari
      ;;
    4)
      echo -e "${CYAN}=== Menghitung Luas Segitiga ===${NC}"
      alas=$(input_angka "Masukkan alas segitiga: ")
      tinggi=$(input_angka "Masukkan tinggi segitiga: ")
      luas_segitiga $alas $tinggi
      ;;
    5)
      echo "Terima kasih sudah menggunakan Penghitung Luas Bangun Datar."
      exit 0
      ;;
    *)
      echo -e "${RED}Pilihan tidak valid. Silakan masukkan angka antara 1 sampai 5."
      sleep 2
      ;;
  esac
  echo -e "\nTekan Enter untuk melanjutkan..."
  read
done