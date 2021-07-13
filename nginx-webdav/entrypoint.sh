#!/bin/sh

if [ -n "$USERNAME" ] && [ -n "$PASSWORD" ]; then
  echo "Configuring username and password..."
  htpasswd -bc /etc/nginx/htpasswd "$USERNAME" "$PASSWORD"
  echo "Configuring username and password done"
else
  echo "WARNING: Not using any means for authentication"
  sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/conf.d/default.conf
  sed -i 's%auth_basic_user_file /etc/nginx/htpasswd;% %g' /etc/nginx/conf.d/default.conf
fi

