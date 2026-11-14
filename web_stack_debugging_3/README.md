# Web stack debugging #3

Using `strace` to find why Apache returns a 500 error on a WordPress site,
then fixing it with Puppet.

## Files

| File | Description |
| ---- | ----------- |
| `0-strace_is_your_friend.pp` | Puppet manifest that fixes the typo in `wp-settings.php` so the site returns 200 again |

## How the bug was found

1. `curl -sI 127.0.0.1` returned `HTTP/1.0 500 Internal Server Error`.
2. `strace` was attached to the running Apache processes with `strace -f -p <pid>`,
   and a request was sent with `curl` while it was watching.
3. The trace showed PHP trying to open a file that does not exist:

   ```
   open("/var/www/html/wp-includes/class-wp-locale.phpp", O_RDONLY) = -1 ENOENT (No such file or directory)
   ```

4. The real file is `class-wp-locale.php`. Line 137 of `/var/www/html/wp-settings.php`
   loads it with a typo (`.phpp`). A failed `require_once` is a fatal PHP error,
   so Apache answered with a 500.

## The fix

The manifest runs `sed -i s/phpp/php/g /var/www/html/wp-settings.php`,
which changes `.phpp` back to `.php`.

```
$ puppet apply 0-strace_is_your_friend.pp
$ curl -sI 127.0.0.1
HTTP/1.1 200 OK
```
