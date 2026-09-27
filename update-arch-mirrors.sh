#!/usr/bin/env bash
set -euo pipefail
if (( EUID != 0 )); then
  echo "ERROR: script must be run as root" >&2
  exit 1
fi
set -x

rate-mirrors --allow-root --protocol=https --save /etc/pacman.d/mirrorlist arch

rate-mirrors --allow-root --protocol=https --save /etc/pacman.d/cachyos-mirrorlist cachyos
cp -f '/etc/pacman.d/cachyos-mirrorlist' '/etc/pacman.d/cachyos-v3-mirrorlist'
cp -f '/etc/pacman.d/cachyos-mirrorlist' '/etc/pacman.d/cachyos-v4-mirrorlist'
sed -i 's|/$arch/|/$arch_v3/|g' '/etc/pacman.d/cachyos-v3-mirrorlist'
sed -i 's|/$arch/|/$arch_v4/|g' '/etc/pacman.d/cachyos-v4-mirrorlist'

# rate-mirrors --allow-root --protocol=https --save /etc/pacman.d/chaotic-mirrorlist chaotic-aur
# rate-mirrors --allow-root --protocol=https --save /etc/pacman.d/blackarch-mirrorlist blackarch
