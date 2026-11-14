# Web stack debugging #0

Finding out why a web server in a Docker container does not answer, and fixing it.

## Files

| File | Description |
| ---- | ----------- |
| `0-give_me_a_page` | Starts Apache inside the `holbertonschool/265-0` container so `curl 0:8080` returns `Hello Holberton` |

## What was wrong

Apache was installed in the container and the page was already there, but the
Apache service was not running. Nothing was listening on port 80, so curl got
an empty reply. Starting the service with `service apache2 start` fixes it.
