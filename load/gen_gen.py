
#
#  SET THESE PARAMS
#
SCALE = 4
MACHINE = ['sdw%d' % i for i in range(1, 5)]
DATADIR = '/data/xdrive/data'

#
#  GEN THE BUILD OF DBGEN
#
print 'set -e'
print 

print '# make dbgen'
print 'cd ../dbgen && make'
print 


#
#  CLONE THE DBGEN DIR TO DATADIR ON REMOTE MACHINES
#
print '# clone dbgen to DATADIR'
for m in MACHINE:
    print "ssh %s 'cd %s && rm -rf dbgen' " % (m, DATADIR)
    print "scp -r ../dbgen %s:%s" % (m, DATADIR)


#
#  RUN DBGEN ON REMOTE MACHINES
#
print 
print '# run dbgen on each machine'

for i in range(len(MACHINE)):
    m = MACHINE[i]
    print "ssh %s 'cd %s/dbgen && ./dbgen -s %d -S %d -C %d' & " % (m,
		DATADIR, 
		SCALE,
		i+1,
		len(MACHINE)) 

#
#  WAIT FOR COMPLETION
#
print 'wait'

#
#  PUSH TO AWS 
#
print 
print '# push tbl files to s3://vitessedata/tpch/*'

print "aws s3 rm s3://vitessedata/tpch/ --recursive" 


for i in range(len(MACHINE)):
    m = MACHINE[i]
    print "ssh %s 'cd %s/dbgen && ls -1 *tbl* > list' & " % (m, DATADIR)

#
#  WAIT FOR COMPLETION
#
print 'wait'


for i in range(len(MACHINE)):
    m = MACHINE[i]
    print "ssh %s 'cd %s/dbgen && for i in $(< list); do echo $i; aws s3 cp $i s3://vitessedata/tpch/$i; done'  & " % (m, DATADIR)


#
#  WAIT FOR COMPLETION
#
print 'wait'
