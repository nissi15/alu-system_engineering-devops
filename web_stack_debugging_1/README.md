# Web stack debugging #1

Finding out why Nginx in an Ubuntu container is not listening on port 80, and fixing it with a script.

## Files

| File | Description |
| ---- | ----------- |
| `0-nginx_likes_port_80` | Makes Nginx listen on port 80 of all the server's active IPv4 IPs |

## What was wrong

Nginx only loads the sites in `/etc/nginx/sites-enabled/`. Normally
`sites-enabled/default` is a link to `sites-available/default`, which listens
on port 80. On the broken server that link was missing or pointed to a config
that does not listen on port 80, so nothing answered on port 80.

## The fix

1. `ln -sf` puts the link back (`-f` replaces whatever file is there now).
2. `service nginx restart` makes Nginx load the fixed config.
