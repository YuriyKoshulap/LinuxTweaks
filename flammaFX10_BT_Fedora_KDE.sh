# Problem: Fedora KDE would not display the (useful) Bluetooth Classic (BR/EDR) → A2DP Sink Bluetooth for Flamma FX10 Headphone Amp in readable format.
# Instead it shows Flamma's FX10 Bluetooth Low Energy (BLE) clearly (as "FX10"). The BT Classic (BR/EDR) is shown as "raw" BT address, like 0C:F3:7A:8B:AB:6B
# Run script below in the console to find 2 exact "raw" address ("Lines mentioning FX10"), and the candidates ("Strong nearby candidate devices seen while FX10 was ON") and follow the prompt.
# Check both with:
# bluetoothctl info [address] (like 4A:F1:7B:9D:AB:6B)
# The correct BT address should have "Icon: audio-headset" line (and perhaps Class: 0x00340404)
# Pair the correct device with 3 commands, like:
# bluetoothctl pair 5A:E1:7B:3D:AB:3B
# bluetoothctl trust 5A:E1:7B:3D:AB:3B
# bluetoothctl connect 5A:E1:7B:3D:AB:3B
# If there are no 2 clear "winners", check the "Strong nearby candidate devices" with "bluetoothctl info [address]" for "Icon: audio-headset"
# If connected to a wrong device, disconnect it with:
# bluetoothctl remove [address]

cat > /tmp/find-fx10-audio.sh <<'EOF'
#!/usr/bin/env bash

echo
echo "Turn FX10 completely OFF now."
read -p "Press Enter when FX10 is OFF... "

# Clear old logs
rm -f /tmp/bt-off.log /tmp/bt-on.log

echo
echo "Scanning with FX10 OFF for 12 seconds..."
{
  echo "menu scan"
  echo "transport auto"
  echo "back"
  echo "scan on"
  sleep 12
  echo "scan off"
  echo "exit"
} | bluetoothctl > /tmp/bt-off.log 2>&1

echo
echo "Now put FX10 into Bluetooth PAIRING mode."
echo "Use the long-press / flashing-light mode, not just normal power-on."
read -p "Press Enter immediately after FX10 is in pairing mode... "

echo
echo "Scanning with FX10 ON for 30 seconds..."
{
  echo "menu scan"
  echo "transport auto"
  echo "back"
  echo "scan on"
  sleep 30
  echo "scan off"
  echo "exit"
} | bluetoothctl > /tmp/bt-on.log 2>&1

echo
echo "=== Lines mentioning FX10 ==="
grep -i fx10 /tmp/bt-on.log || echo "No named FX10 found."

echo
echo "=== Strong nearby candidate devices seen while FX10 was ON ==="
python3 - <<'PY'
import re

def parse(path):
    d = {}
    names = {}
    with open(path, errors="ignore") as f:
        for line in f:
            m = re.search(r'Device ([0-9A-F:]{17})(?: (.*))?$', line.strip())
            if m:
                mac = m.group(1)
                name = (m.group(2) or "").strip()
                if name:
                    names[mac] = name
                d.setdefault(mac, None)
            r = re.search(r'Device ([0-9A-F:]{17}) RSSI: .*?\((-?\d+)\)', line)
            if r:
                mac = r.group(1)
                rssi = int(r.group(2))
                if d.get(mac) is None or rssi > d[mac]:
                    d[mac] = rssi
    return d, names

off, offnames = parse("/tmp/bt-off.log")
on, onnames = parse("/tmp/bt-on.log")

cands = []
for mac, rssi in on.items():
    if mac == "0F:B3:8A:8B:AB:7B":
        continue
    was = off.get(mac)
    name = onnames.get(mac, "")
    # show devices that are new, or got much stronger, or are fairly strong
    if was is None or (rssi is not None and was is not None and rssi - was >= 12) or (rssi is not None and rssi >= -70):
        cands.append((rssi if rssi is not None else -999, mac, was, name))

if not cands:
    print("No obvious candidates found.")
else:
    for rssi, mac, was, name in sorted(cands, reverse=True):
        before = "not seen before" if was is None else f"off RSSI {was}"
        label = name if name else "(unnamed)"
        print(f"{mac}  on RSSI {rssi}  [{before}]  {label}")
PY

echo
echo "Logs saved as:"
echo "/tmp/bt-off.log"
echo "/tmp/bt-on.log"
EOF

bash /tmp/find-fx10-audio.sh
