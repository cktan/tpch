set -e

# make dbgen
cd ../dbgen && make

# clone dbgen to DATADIR
ssh -i /home/cktan/pem/aws-us-west-1-test.pem ubuntu@sdw1 bash -c 'cd /data/xdrive/data && rm -rf dbgen' 
scp -i /home/cktan/pem/aws-us-west-1-test.pem -r ../dbgen ubuntu@sdw1:/data/xdrive/data
ssh -i /home/cktan/pem/aws-us-west-1-test.pem ubuntu@sdw2 bash -c 'cd /data/xdrive/data && rm -rf dbgen' 
scp -i /home/cktan/pem/aws-us-west-1-test.pem -r ../dbgen ubuntu@sdw2:/data/xdrive/data
ssh -i /home/cktan/pem/aws-us-west-1-test.pem ubuntu@sdw3 bash -c 'cd /data/xdrive/data && rm -rf dbgen' 
scp -i /home/cktan/pem/aws-us-west-1-test.pem -r ../dbgen ubuntu@sdw3:/data/xdrive/data
ssh -i /home/cktan/pem/aws-us-west-1-test.pem ubuntu@sdw4 bash -c 'cd /data/xdrive/data && rm -rf dbgen' 
scp -i /home/cktan/pem/aws-us-west-1-test.pem -r ../dbgen ubuntu@sdw4:/data/xdrive/data

# run dbgen on each machine
ssh -i /home/cktan/pem/aws-us-west-1-test.pem ubuntu@sdw1 bash -c 'cd /data/xdrive/data/dbgen && ./dbgen -s 4 -S 1 -C 4 &' 
ssh -i /home/cktan/pem/aws-us-west-1-test.pem ubuntu@sdw2 bash -c 'cd /data/xdrive/data/dbgen && ./dbgen -s 4 -S 2 -C 4 &' 
ssh -i /home/cktan/pem/aws-us-west-1-test.pem ubuntu@sdw3 bash -c 'cd /data/xdrive/data/dbgen && ./dbgen -s 4 -S 3 -C 4 &' 
ssh -i /home/cktan/pem/aws-us-west-1-test.pem ubuntu@sdw4 bash -c 'cd /data/xdrive/data/dbgen && ./dbgen -s 4 -S 4 -C 4 &' 
wait
