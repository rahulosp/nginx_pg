#!/bin/bash


service nginx start

#su - postgres -c "/etc/init.d/postgresql start"
#su - postgres -c 'psql --command "CREATE USER docker WITH SUPERUSER PASSWORD '"'"'docker'"'"';"'
#su - postgres -c 'createdb -O docker docker'

#su - postgres -c 'echo "created docker db"'
#su - postgres -c 'echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/13/main/pg_hba.conf'
#su - postgres -c 'echo "listen_addresses=\'*\'" >> /etc/postgresql/13/main/postgresql.conf'

#tee /etc/postgresql/13/main/postgresql.conf <<EOF
#listen_addresses='*'
#EOF

#su - postgres -c "/etc/init.d/postgresql restart"
su - postgres -c 'echo "nginx started"'

su - postgres -c '/usr/lib/postgresql/13/bin/postgres -D /var/lib/postgresql/13/main -c config_file=/etc/postgresql/13/main/postgresql.conf'
exec "$@"
