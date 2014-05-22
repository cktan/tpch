echo warm up
psql -ef warmup.sql > /dev/null
echo exx0
psql -ef queries_exx0.sql > out.exx0
echo exx1
psql -ef queries_exx1.sql > out.exx1
python parse.py out.exx0 out.exx1
