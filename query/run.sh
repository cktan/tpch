echo "Make sure you run ANALYZE on the tpch database."

echo vitesse.enable=0
psql tpch -ef run0.sql >& out0

echo vitesse.enable=1
psql tpch -ef run1.sql >& out1

python parse.py out0 out1
