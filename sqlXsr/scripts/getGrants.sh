echo "Schema name: \c"
read S
db2look -d xsrday -z "$S" -i xsrdbadm -w xsr4ever -x -o "$S"_grants.ddl

