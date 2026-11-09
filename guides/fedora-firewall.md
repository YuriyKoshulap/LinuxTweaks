# Fedora firewall: use the public zone

Fedora Workstation may use the `FedoraWorkstation` firewalld zone, which allows all TCP and UDP ports from 1025 to 65535 by default. This is convenient for desktop applications, but it is more permissive than necessary on a typical laptop. Switching to the `public` zone removes that blanket high-port allowance while leaving normal outbound connections unaffected.

```bash
sudo firewall-cmd --set-default-zone=public
```

The change takes effect immediately; no reboot or firewalld restart is required.

Verify:

```bash
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --get-default-zone
```
