#!/bin/bash


service nginx start
echo "root says nginx started"

service postgresql start
echo "root says postgresql started"
#su - postgres -c "/etc/init.d/postgresql start"
#su - postgres -c 'psql --command "CREATE USER docker WITH SUPERUSER PASSWORD '"'"'docker'"'"';"'
#su - postgres -c 'createdb -O docker docker'

#su - postgres -c 'echo "created docker db"'
#su - postgres -c 'echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/13/main/pg_hba.conf'
#su - postgres -c 'echo "listen_addresses=\'*\'" >> /etc/postgresql/13/main/postgresql.conf'

#######Spinning Shell here as containers to not allocate pty#########
#echo "import pty; pty.spawn('/bin/bash')" > /tmp/asdf.py
#python /tmp/asdf.py
############################################
#su - postgres -c 'echo "nginx started"'
while /bin/true; do
  ps aux |grep postgres |grep -q -v grep
  POSTGRESQL_STATUS=$?
  ps aux |grep nginx |grep -q -v grep
  NGINX_STATUS=$?

  echo "Checking running processes..."
  if [ $POSTGRESQL_STATUS -ne 0 -o $NGINX_STATUS -ne 0 ]; then
    echo "Either Postgresql or Nginx is NOT Running"
    exit -1
  fi
  echo "All services are running OK"
  sleep 600
done
#su - postgres -c '/usr/lib/postgresql/13/bin/postgres -D /var/lib/postgresql/13/main -c config_file=/etc/postgresql/13/main/postgresql.conf'
