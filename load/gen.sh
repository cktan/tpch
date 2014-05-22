echo -- ------------------ 
echo -- set up the data dir
echo -- ------------------ 
rm -rf data ; mkdir data

echo -- ------------------ 
echo -- run dbgen
echo -- ------------------ 
(cd ../dbgen && dbgen -f -s 1)
mv ../dbgen/*.tbl data/

echo -- ------------------ 
echo -- prepare for load 
echo -- ------------------ 
(cd data && perl -pi -e 's/\|$//' *.tbl)

echo DONE. To load, run psql -ef load.sql

