# Web stack debugging #2

Running software as a user other than root, so a security hole in a program
cannot give an attacker full control of the server.

## Files

| File | Description |
| ---- | ----------- |
| `0-iamsomeoneelse` | Runs `whoami` as the user passed as the first argument, using `sudo -u` |
| `1-run_nginx_as_nginx` | Makes Nginx run as the `nginx` user and listen on port 8080 of all active IPs |

## Usage

```
$ ./0-iamsomeoneelse www-data
www-data
```

## How `1-run_nginx_as_nginx` works

| Command | Why |
| ------- | --- |
| `pkill apache2` | Apache was using port 8080, so Nginx could not take it |
| `service nginx stop` | Stops the old Nginx that was running as root |
| `sed -i ... sites-available/default` | Changes `listen 80` to `listen 8080` (IPv4 and IPv6) |
| `chmod 644 /etc/nginx/nginx.conf` | The config was readable only by root; the nginx user must read it |
| `chown -R nginx:nginx /var/log/nginx` | The nginx user must be able to write its logs |
| `touch` + `chown` on `/run/nginx.pid` | The nginx user must be able to write its PID file |
| `sudo -u nginx nginx` | Starts Nginx as the nginx user. `service nginx start` only works as root, so Nginx is started directly |
