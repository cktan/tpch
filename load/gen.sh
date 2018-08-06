set -e

# make dbgen
cd ../dbgen && make

# clone dbgen to DATADIR
ssh sdw1 'cd /data/xdrive/data && rm -rf dbgen' 
scp -r ../dbgen sdw1:/data/xdrive/data
ssh sdw2 'cd /data/xdrive/data && rm -rf dbgen' 
scp -r ../dbgen sdw2:/data/xdrive/data
ssh sdw3 'cd /data/xdrive/data && rm -rf dbgen' 
scp -r ../dbgen sdw3:/data/xdrive/data
ssh sdw4 'cd /data/xdrive/data && rm -rf dbgen' 
scp -r ../dbgen sdw4:/data/xdrive/data

# run dbgen on each machine
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 1 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 2 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 3 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 4 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 5 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 6 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 7 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 8 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 9 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 10 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 11 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 12 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 13 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 14 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 15 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 16 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 17 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 18 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 19 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 20 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 21 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 22 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 23 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 24 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 25 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 26 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 27 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 28 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 29 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 30 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 31 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 32 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 33 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 34 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 35 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 36 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 37 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 38 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 39 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 40 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 41 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 42 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 43 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 44 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 45 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 46 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 47 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 48 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 49 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 50 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 51 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 52 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 53 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 54 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 55 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 56 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 57 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 58 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 59 -C 60' & 
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4000 -S 60 -C 60' & 
wait

# push tbl files to s3://vitessedata/tpch/*
aws s3 rm s3://vitessedata/tpch/ --recursive
ssh sdw1 'cd /data/xdrive/data/dbgen && rm -f list* && ls -1 *tbl* > list && spit -n 8 list list' & 
ssh sdw2 'cd /data/xdrive/data/dbgen && rm -f list* && ls -1 *tbl* > list && spit -n 8 list list' & 
ssh sdw3 'cd /data/xdrive/data/dbgen && rm -f list* && ls -1 *tbl* > list && spit -n 8 list list' & 
ssh sdw4 'cd /data/xdrive/data/dbgen && rm -f list* && ls -1 *tbl* > list && spit -n 8 list list' & 
wait

ssh sdw1 'cd /data/xdrive/data/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do aws s3 cp $j s3://vitessedata/tpch/$j ; done ) & 
                   done ) && 
             wait'  &
ssh sdw2 'cd /data/xdrive/data/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do aws s3 cp $j s3://vitessedata/tpch/$j ; done ) & 
                   done ) && 
             wait'  &
ssh sdw3 'cd /data/xdrive/data/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do aws s3 cp $j s3://vitessedata/tpch/$j ; done ) & 
                   done ) && 
             wait'  &
ssh sdw4 'cd /data/xdrive/data/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do aws s3 cp $j s3://vitessedata/tpch/$j ; done ) & 
                   done ) && 
             wait'  &

wait

