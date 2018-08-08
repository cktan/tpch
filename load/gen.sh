set -e

# make dbgen
cd ../dbgen && make

aws s3 rm s3://vitessedata/tpch/ --recursive || true
aws s3 ls s3://vitessedata
ssh sdw1 'aws s3 ls s3://vitessedata' 
ssh sdw2 'aws s3 ls s3://vitessedata' 
# clone dbgen to DATADIR
ssh sdw1 'cd /data4 && rm -rf dbgen' 
scp -r ../dbgen sdw1:/data4
ssh sdw2 'cd /data4 && rm -rf dbgen' 
scp -r ../dbgen sdw2:/data4

# run dbgen on each machine
ssh sdw1 'cat > /data4/dbgen/mygen.sh' <<HEREHERE
set -e
./dbgen -f -s 2000 -S 1 -C 40 &
./dbgen -f -s 2000 -S 2 -C 40 &
./dbgen -f -s 2000 -S 3 -C 40 &
./dbgen -f -s 2000 -S 4 -C 40 &
./dbgen -f -s 2000 -S 5 -C 40 &
./dbgen -f -s 2000 -S 6 -C 40 &
./dbgen -f -s 2000 -S 7 -C 40 &
./dbgen -f -s 2000 -S 8 -C 40 &
./dbgen -f -s 2000 -S 9 -C 40 &
./dbgen -f -s 2000 -S 10 -C 40 &
./dbgen -f -s 2000 -S 11 -C 40 &
./dbgen -f -s 2000 -S 12 -C 40 &
./dbgen -f -s 2000 -S 13 -C 40 &
./dbgen -f -s 2000 -S 14 -C 40 &
./dbgen -f -s 2000 -S 15 -C 40 &
./dbgen -f -s 2000 -S 16 -C 40 &
./dbgen -f -s 2000 -S 17 -C 40 &
./dbgen -f -s 2000 -S 18 -C 40 &
./dbgen -f -s 2000 -S 19 -C 40 &
./dbgen -f -s 2000 -S 20 -C 40 &

wait
HEREHERE

ssh sdw1 'cd /data4/dbgen && bash mygen.sh' &

ssh sdw2 'cat > /data4/dbgen/mygen.sh' <<HEREHERE
set -e
./dbgen -f -s 2000 -S 21 -C 40 &
./dbgen -f -s 2000 -S 22 -C 40 &
./dbgen -f -s 2000 -S 23 -C 40 &
./dbgen -f -s 2000 -S 24 -C 40 &
./dbgen -f -s 2000 -S 25 -C 40 &
./dbgen -f -s 2000 -S 26 -C 40 &
./dbgen -f -s 2000 -S 27 -C 40 &
./dbgen -f -s 2000 -S 28 -C 40 &
./dbgen -f -s 2000 -S 29 -C 40 &
./dbgen -f -s 2000 -S 30 -C 40 &
./dbgen -f -s 2000 -S 31 -C 40 &
./dbgen -f -s 2000 -S 32 -C 40 &
./dbgen -f -s 2000 -S 33 -C 40 &
./dbgen -f -s 2000 -S 34 -C 40 &
./dbgen -f -s 2000 -S 35 -C 40 &
./dbgen -f -s 2000 -S 36 -C 40 &
./dbgen -f -s 2000 -S 37 -C 40 &
./dbgen -f -s 2000 -S 38 -C 40 &
./dbgen -f -s 2000 -S 39 -C 40 &
./dbgen -f -s 2000 -S 40 -C 40 &

wait
HEREHERE

ssh sdw2 'cd /data4/dbgen && bash mygen.sh' &

wait

# push tbl files to s3://vitessedata/tpch/*
aws s3 rm s3://vitessedata/tpch/ --recursive  || true
ssh sdw1 'cd /data4/dbgen && rm -f list* && ls -1 *tbl* | shuf > list && split -n l/8 list list' & 
ssh sdw2 'cd /data4/dbgen && rm -f list* && ls -1 *tbl* | shuf > list && split -n l/8 list list' & 
wait

ssh sdw1 'cd /data4/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do aws s3 cp $j s3://vitessedata/tpch/$j ; done ) & 
                   done ) && 
             wait'  &
ssh sdw2 'cd /data4/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do aws s3 cp $j s3://vitessedata/tpch/$j ; done ) & 
                   done ) && 
             wait'  &

wait

