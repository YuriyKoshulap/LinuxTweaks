# Fedora firewall: use the public zone

Fedora Workstation may use the `FedoraWorkstation` firewalld zone, which allows high TCP/UDP ports by default. To use the more restrictive `public` zone as the default:

```bash
sudo firewall-cmd --set-default-zone=public
```

The change takes effect immediately; no reboot or firewalld restart is required.

Verify:

```bash
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --get-default-zone
```
