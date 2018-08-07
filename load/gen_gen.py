
#
#  SET THESE PARAMS
#
SCALE = 2000
MACHINE = ['sdw1', 'sdw2']
NMACHINE = len(MACHINE)
DATADIR = '/data4'

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

C = min(SCALE, NMACHINE * 15)   # up to 15 dbgen procs per machine
S = 0
for c in range(C):
    m = MACHINE[c/15]
    S = S + 1    
    print "ssh %s 'cd %s/dbgen && ./dbgen -s %d -S %d -C %d' & " % (m,
		DATADIR, 
		SCALE,
		S,
		C)


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
    print "ssh %s 'cd %s/dbgen && rm -f list* && ls -1 *tbl* > list && spit -n 8 list list' & " % (m, DATADIR)

#
#  WAIT FOR COMPLETION
#
print 'wait'
print


for i in range(len(MACHINE)):
    m = MACHINE[i]
    print '''ssh %s 'cd %s/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do aws s3 cp $j s3://vitessedata/tpch/$j ; done ) & 
                   done ) && 
             wait'  &''' % (m, DATADIR)


#
#  WAIT FOR COMPLETION
#
print
print 'wait'
print
