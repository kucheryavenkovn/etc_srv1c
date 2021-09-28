#/bin/bash
export PGPASSWORD=secret1c
/opt/pgpro/1c-13/bin/pg_dump -h 127.0.0.1 -U postgres --format custom -b --section pre-data --section data --section post-data --verbose --file /backup/ro/ro_backup$(date +%Y-%m-%d).bkp ro_backup
find /backup/ro/ -ctime +4 -name "*.bkp" -exec rm {} \;
/opt/pgpro/1c-13/bin/pg_dump -h 127.0.0.1 -U postgres --format custom -b --section pre-data --section data --section post-data --verbose --file /backup/ro/ro-$(date +%Y-%m-%d).bkp ro
/opt/pgpro/1c-13/bin/pg_dump -h 127.0.0.1 -U postgres --format custom -b --section pre-data --section data --section post-data --verbose --file /backup/do/do-$(date +%Y-%m-%d).bkp do
find /backup/do/ -ctime +8 -name "*.bkp" -exec rm {} \;
/opt/pgpro/1c-13/bin/pg_dump -h 127.0.0.1 -U postgres --format custom -b --section pre-data --section data --section post-data --verbose --file /backup/zup/zup-$(date +%Y-%m-%d).bkp zup
find /backup/zup/ -ctime +8 -name "*.bkp" -exec rm {} \;
/opt/pgpro/1c-13/bin/pg_dump -h 127.0.0.1 -U postgres --format custom -b --section pre-data --section data --section post-data --verbose --file /backup/bp/bp-$(date +%Y-%m-%d).bkp bp
find /backup/bp/ -ctime +8 -name "*.bkp" -exec rm {} \;