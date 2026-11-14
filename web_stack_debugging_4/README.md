# Web stack debugging #4

Load testing Nginx with ApacheBench, finding why requests fail under pressure,
and fixing it with Puppet.

## Files

| File | Description |
| ---- | ----------- |
| `0-the_sky_is_the_limit_not.pp` | Raises the Nginx open file limit from 15 to 4096 and restarts Nginx |

## How the bug was found

1. `ab -c 100 -n 2000 localhost/` sends 2000 requests, 100 at a time.
   Hundreds of them failed.
2. The Nginx error log (`/var/log/nginx/error.log`) was full of:

   ```
   accept4() failed (24: Too many open files)
   open() "/usr/share/nginx/html/index.html" failed (24: Too many open files)
   ```

3. On Linux every connection and every file a program opens uses a
   "file descriptor", and each program has a limit. `/etc/default/nginx` set
   that limit to `ULIMIT="-n 15"`, so Nginx could only have 15 open at once.
   With 100 requests at a time it ran out and failed the rest.

## The fix

| Resource | What it does |
| -------- | ------------ |
| `Exec['fix--for-nginx']` | Changes `-n 15` to `-n 4096` in `/etc/default/nginx` |
| `Exec['restart-nginx']` | Restarts Nginx so the new limit is used. `require` makes it run after the fix |

```
$ puppet apply 0-the_sky_is_the_limit_not.pp
$ ab -c 100 -n 2000 localhost/
Failed requests:        0
```
