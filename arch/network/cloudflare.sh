#!/bin/bash

# set dns to Cloudflare/APNIC and ignore auto dns from the dhcp server for the active wifi connection (https://1.1.1.1/dns/)
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv4.dns 1.1.1.1,1.0.0.1
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv4.ignore-auto-dns yes
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv4.method auto
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv6.dns 2606:4700:4700::1111,2606:4700:4700::1001
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv6.ignore-auto-dns yes
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv6.method auto

