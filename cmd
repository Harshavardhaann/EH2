Wifi

aircrack-ng wpa-Induction.pcap
aircrack-ng -w rockyou.txt -b 00:0C:41:82:B2:55 wpa-Induction.pcap



Bluetooth

git clone https://github.com/mikeryan/crackle
crackle -i ltk_exchange.pcap
crackle -i ltk_exchange.pcap -o some.pcap
