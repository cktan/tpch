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
./dbgen -f -s 2000 -S 1 -C 80 &
./dbgen -f -s 2000 -S 2 -C 80 &
./dbgen -f -s 2000 -S 3 -C 80 &
./dbgen -f -s 2000 -S 4 -C 80 &
./dbgen -f -s 2000 -S 5 -C 80 &
./dbgen -f -s 2000 -S 6 -C 80 &
./dbgen -f -s 2000 -S 7 -C 80 &
./dbgen -f -s 2000 -S 8 -C 80 &
./dbgen -f -s 2000 -S 9 -C 80 &
./dbgen -f -s 2000 -S 10 -C 80 &
./dbgen -f -s 2000 -S 11 -C 80 &
./dbgen -f -s 2000 -S 12 -C 80 &
./dbgen -f -s 2000 -S 13 -C 80 &
./dbgen -f -s 2000 -S 14 -C 80 &
./dbgen -f -s 2000 -S 15 -C 80 &
./dbgen -f -s 2000 -S 16 -C 80 &
./dbgen -f -s 2000 -S 17 -C 80 &
./dbgen -f -s 2000 -S 18 -C 80 &
./dbgen -f -s 2000 -S 19 -C 80 &
./dbgen -f -s 2000 -S 20 -C 80 &
./dbgen -f -s 2000 -S 21 -C 80 &
./dbgen -f -s 2000 -S 22 -C 80 &
./dbgen -f -s 2000 -S 23 -C 80 &
./dbgen -f -s 2000 -S 24 -C 80 &
./dbgen -f -s 2000 -S 25 -C 80 &
./dbgen -f -s 2000 -S 26 -C 80 &
./dbgen -f -s 2000 -S 27 -C 80 &
./dbgen -f -s 2000 -S 28 -C 80 &
./dbgen -f -s 2000 -S 29 -C 80 &
./dbgen -f -s 2000 -S 30 -C 80 &
./dbgen -f -s 2000 -S 31 -C 80 &
./dbgen -f -s 2000 -S 32 -C 80 &
./dbgen -f -s 2000 -S 33 -C 80 &
./dbgen -f -s 2000 -S 34 -C 80 &
./dbgen -f -s 2000 -S 35 -C 80 &
./dbgen -f -s 2000 -S 36 -C 80 &
./dbgen -f -s 2000 -S 37 -C 80 &
./dbgen -f -s 2000 -S 38 -C 80 &
./dbgen -f -s 2000 -S 39 -C 80 &
./dbgen -f -s 2000 -S 40 -C 80 &

wait
HEREHERE

ssh sdw1 'cd /data4/dbgen && bash mygen.sh' &

ssh sdw2 'cat > /data4/dbgen/mygen.sh' <<HEREHERE
set -e
./dbgen -f -s 2000 -S 41 -C 80 &
./dbgen -f -s 2000 -S 42 -C 80 &
./dbgen -f -s 2000 -S 43 -C 80 &
./dbgen -f -s 2000 -S 44 -C 80 &
./dbgen -f -s 2000 -S 45 -C 80 &
./dbgen -f -s 2000 -S 46 -C 80 &
./dbgen -f -s 2000 -S 47 -C 80 &
./dbgen -f -s 2000 -S 48 -C 80 &
./dbgen -f -s 2000 -S 49 -C 80 &
./dbgen -f -s 2000 -S 50 -C 80 &
./dbgen -f -s 2000 -S 51 -C 80 &
./dbgen -f -s 2000 -S 52 -C 80 &
./dbgen -f -s 2000 -S 53 -C 80 &
./dbgen -f -s 2000 -S 54 -C 80 &
./dbgen -f -s 2000 -S 55 -C 80 &
./dbgen -f -s 2000 -S 56 -C 80 &
./dbgen -f -s 2000 -S 57 -C 80 &
./dbgen -f -s 2000 -S 58 -C 80 &
./dbgen -f -s 2000 -S 59 -C 80 &
./dbgen -f -s 2000 -S 60 -C 80 &
./dbgen -f -s 2000 -S 61 -C 80 &
./dbgen -f -s 2000 -S 62 -C 80 &
./dbgen -f -s 2000 -S 63 -C 80 &
./dbgen -f -s 2000 -S 64 -C 80 &
./dbgen -f -s 2000 -S 65 -C 80 &
./dbgen -f -s 2000 -S 66 -C 80 &
./dbgen -f -s 2000 -S 67 -C 80 &
./dbgen -f -s 2000 -S 68 -C 80 &
./dbgen -f -s 2000 -S 69 -C 80 &
./dbgen -f -s 2000 -S 70 -C 80 &
./dbgen -f -s 2000 -S 71 -C 80 &
./dbgen -f -s 2000 -S 72 -C 80 &
./dbgen -f -s 2000 -S 73 -C 80 &
./dbgen -f -s 2000 -S 74 -C 80 &
./dbgen -f -s 2000 -S 75 -C 80 &
./dbgen -f -s 2000 -S 76 -C 80 &
./dbgen -f -s 2000 -S 77 -C 80 &
./dbgen -f -s 2000 -S 78 -C 80 &
./dbgen -f -s 2000 -S 79 -C 80 &
./dbgen -f -s 2000 -S 80 -C 80 &

wait
HEREHERE

ssh sdw2 'cd /data4/dbgen && bash mygen.sh' &

wait

# push tbl files to s3://vitessedata/tpch/*
aws s3 rm s3://vitessedata/tpch/ --recursive  || true
ssh sdw1 'cd /data4/dbgen && rm -f list* && ls -1 *tbl* | shuf > list && split -n l/10 list list' & 
ssh sdw2 'cd /data4/dbgen && rm -f list* && ls -1 *tbl* | shuf > list && split -n l/10 list list' & 
wait

ssh sdw1 'cd /data4/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do F=$(( $RANDOM % 10 )); echo $j; aws s3 cp $j s3://vitessedata/tpch/$F/$j --quiet; done ) & 
                   done ) && 
             wait'  &
ssh sdw2 'cd /data4/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do F=$(( $RANDOM % 10 )); echo $j; aws s3 cp $j s3://vitessedata/tpch/$F/$j --quiet; done ) & 
                   done ) && 
             wait'  &

wait

