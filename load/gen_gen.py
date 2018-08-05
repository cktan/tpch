
#
#  SET THESE PARAMS
#
SCALE = 4
MACHINE = ['sdw%d' % i for i in range(1, 5)]
UNAME = 'ubuntu'
PEMFILE = '/home/cktan/pem/aws-us-west-1-test.pem'
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
    print "ssh -i %s %s@%s bash -c 'cd %s && rm -rf dbgen' " % (PEMFILE, UNAME, m, DATADIR)
    print "scp -i %s -r ../dbgen %s@%s:%s" % (PEMFILE, UNAME, m, DATADIR)


#
#  RUN DBGEN ON REMOTE MACHINES
#
print 
print '# run dbgen on each machine'

for i in range(len(MACHINE)):
    m = MACHINE[i]
    print "ssh -i %s %s@%s bash -c 'cd %s/dbgen && ./dbgen -s %d -S %d -C %d &' " % (PEMFILE, 
		UNAME, m, DATADIR, 
		SCALE,
		i+1,
		len(MACHINE)) 

#
#  WAIT FOR COMPLETION
#
print 'wait'


