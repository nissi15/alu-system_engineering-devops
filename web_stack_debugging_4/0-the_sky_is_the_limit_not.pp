# Raises the Nginx open file limit from 15 to 4096 so it can handle many requests at once

# Change the limit in the Nginx defaults file
exec { 'fix--for-nginx':
  command => 'sed -i "s/-n 15/-n 4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
}

# Restart Nginx so it uses the new limit
exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => '/usr/sbin/:/usr/bin/:/sbin/:/bin/',
  require => Exec['fix--for-nginx'],
}
