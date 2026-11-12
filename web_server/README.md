# Web server

Installing and configuring the Nginx web server on an Ubuntu server.

## Files

| File | Description |
| ---- | ----------- |
| `0-transfer_file` | Transfers a file to a server's home directory with `scp` |
| `1-install_nginx_web_server` | Installs Nginx and serves a page containing `Holberton School` |
| `2-setup_a_domain_name` | The domain name pointing to the web-01 server |
| `3-redirection` | Adds a `301 Moved Permanently` redirect for `/redirect_me` |
| `4-not_found_page_404` | Adds a custom 404 page containing `Ceci n'est pas une page` |
| `5-design_a_beautiful_404_page.html` | A creative 404 page |

## Usage

```
$ ./0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
$ sudo ./1-install_nginx_web_server
$ sudo ./3-redirection
$ sudo ./4-not_found_page_404
```

Scripts 1, 3 and 4 run on the server itself. They restart Nginx with
`service`, not `systemctl`.
