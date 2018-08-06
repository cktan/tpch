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
ssh sdw1 'cd /data/xdrive/data/dbgen && ./dbgen -s 4 -S 1 -C 4' & 
ssh sdw2 'cd /data/xdrive/data/dbgen && ./dbgen -s 4 -S 2 -C 4' & 
ssh sdw3 'cd /data/xdrive/data/dbgen && ./dbgen -s 4 -S 3 -C 4' & 
ssh sdw4 'cd /data/xdrive/data/dbgen && ./dbgen -s 4 -S 4 -C 4' & 
wait

# push tbl files to s3://vitessedata/tpch/*
aws s3 rm s3://vitessedata/tpch/ --recursive
ssh sdw1 'cd /data/xdrive/data/dbgen && ls -1 *tbl* > list' & 
ssh sdw2 'cd /data/xdrive/data/dbgen && ls -1 *tbl* > list' & 
ssh sdw3 'cd /data/xdrive/data/dbgen && ls -1 *tbl* > list' & 
ssh sdw4 'cd /data/xdrive/data/dbgen && ls -1 *tbl* > list' & 
wait
ssh sdw1 'cd /data/xdrive/data/dbgen && for i in $(< list); do echo $i; aws s3 cp $i s3://vitessedata/tpch/$i; done'  & 
ssh sdw2 'cd /data/xdrive/data/dbgen && for i in $(< list); do echo $i; aws s3 cp $i s3://vitessedata/tpch/$i; done'  & 
ssh sdw3 'cd /data/xdrive/data/dbgen && for i in $(< list); do echo $i; aws s3 cp $i s3://vitessedata/tpch/$i; done'  & 
ssh sdw4 'cd /data/xdrive/data/dbgen && for i in $(< list); do echo $i; aws s3 cp $i s3://vitessedata/tpch/$i; done'  & 
wait
