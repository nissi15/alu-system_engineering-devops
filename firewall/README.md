# Firewall

Protecting a web server with the `ufw` firewall so only the ports it needs are open.

## Files

| File | Description |
| ---- | ----------- |
| `0-block_all_incoming_traffic_but` | The `ufw` commands used on web-01 to block all incoming traffic except TCP ports 22 (SSH), 80 (HTTP) and 443 (HTTPS) |

## Why the order matters

Port 22 is allowed **before** `ufw enable`. If the firewall were turned on first,
it would block SSH and lock us out of the server.
