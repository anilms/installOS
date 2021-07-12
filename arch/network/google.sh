#!/bin/bash

# set dns to Cloudflare/APNIC and ignore auto dns from the dhcp server for the active wifi connection (https://1.1.1.1/dns/)
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv4.dns 8.8.8.8,8.8.4.4
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv4.ignore-auto-dns yes
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv4.method auto
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv6.dns 2001:4860:4860::8888,2001:4860:4860::8844
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv6.ignore-auto-dns yes
nmcli connection modify $(nmcli connection show --active | grep wifi | awk '{ print $1 }') +ipv6.method auto

