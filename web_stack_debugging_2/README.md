# Web stack debugging #2

Running software as a user other than root, so a security hole in a program
cannot give an attacker full control of the server.

## Files

| File | Description |
| ---- | ----------- |
| `0-iamsomeoneelse` | Runs `whoami` as the user passed as the first argument, using `sudo -u` |

## Usage

```
$ ./0-iamsomeoneelse www-data
www-data
```
