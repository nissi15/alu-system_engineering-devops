# SSH

Using SSH keys to connect to a remote server without a password.

## Files

| File | Description |
| ---- | ----------- |
| `0-use_a_private_key` | Connects to the server with the private key `~/.ssh/school` as `ubuntu` |
| `1-create_ssh_key_pair` | Creates a 4096-bit RSA key pair named `school`, protected by a passphrase |
| `2-ssh_config` | SSH client configuration that uses `~/.ssh/school` and refuses password authentication |

## Task 3: Let me in!

The provided public key was added to `~/.ssh/authorized_keys` for the
`ubuntu` user on the server, so it can connect without a password.
