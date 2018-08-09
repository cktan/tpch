echo vitesse.enable=0
psql tpch -ef run.sql -v exx=0 >& out0
echo vitesse.enable=1
psql tpch -ef run.sql -v exx=1 >& out1
python parse.py out0 out1
