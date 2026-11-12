# Load balancer

Putting two Nginx web servers behind an HAProxy load balancer.

## Files

| File | Description |
| ---- | ----------- |
| `0-custom_http_response_header` | Configures Nginx on a new Ubuntu machine to add an `X-Served-By` header set to the server's hostname |
| `1-install_load_balancer` | Installs HAProxy on a new Ubuntu machine and sends traffic to web-01 and web-02 using roundrobin |
