#!/bin/sh

opkg remove enigma2-plugin-extensions-suptv

# Téléchargement du fichier .ipk depuis GitHub
wget -O /tmp/enigma2-plugin-extensions-suptv_4.3_all.ipk http://team4e2.xyz/plugins/enigma2-plugin-extensions-suptv_4.3_all.ipk

# Installation du fichier .ipk
opkg install /tmp/enigma2-plugin-extensions-suptv_4.1_all.ipk

# Optionnel: Redémarrer Enigma2 ou recharger le service
sleep 3
killall -9 enigma2
exit 0

