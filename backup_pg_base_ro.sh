#/bin/bash
export PGPASSWORD=secret1c
/opt/pgpro/1c-13/bin/pg_dump -h 127.0.0.1 -U postgres --format custom -b --section pre-data --section data --section post-data --verbose --file /backup/ro/ro-$(date +%Y-%m-%d).bkp ro
