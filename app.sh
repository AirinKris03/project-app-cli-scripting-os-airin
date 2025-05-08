#!/bin/bash

# code warna ANSI
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# membuat function untuk menampilkan menu
function tampilkan_menu() {
  echo -e "${CYAN}=== Kalkulator Luas Bangun Datar ===${NC}"
  echo -e "${YELLOW}1. Persegi"
  echo "2. Persegi Panjang"
  echo "3. Lingkaran"
  echo "4. Segitiga"
  echo "5. Keluar${NC}"
}