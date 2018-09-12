
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


#  CLEAN UP s3 and make sure we can use awscli
print "aws s3 rm s3://vitessedata/tpch/ --recursive || true"
print "aws s3 ls s3://vitessedata"
for m in MACHINE:
    print "ssh %s 'aws s3 ls s3://vitessedata' " % m


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

out = ['' for m in MACHINE]

CMAXPERMACHINE = 40    # up to 20 dbgen procs per machine
C = min(SCALE, NMACHINE * CMAXPERMACHINE)
S = 0
for c in range(C):
    S = S + 1 
    out[c/CMAXPERMACHINE] += ("./dbgen -f -s %d -S %d -C %d &\n" % (SCALE, S, C))


for i in range(len(MACHINE)):
    m = MACHINE[i]
    print "ssh %s 'cat > %s/dbgen/mygen.sh' <<HEREHERE" % (m, DATADIR)
    print 'set -e'
    print out[i]
    print 'wait'
    print 'HEREHERE'
    print
    print "ssh %s 'cd %s/dbgen && bash mygen.sh' &" % (m, DATADIR)
    print
    

#
#  WAIT FOR COMPLETION
#
print 'wait'

#
#  PUSH TO AWS 
#
print 
print '# push tbl files to s3://vitessedata/tpch/*'

print "aws s3 rm s3://vitessedata/tpch/ --recursive  || true"


for i in range(len(MACHINE)):
    m = MACHINE[i]
    print "ssh %s 'cd %s/dbgen && rm -f list* && ls -1 *tbl* | shuf > list && split -n l/8 list list' & " % (m, DATADIR)

#
#  WAIT FOR COMPLETION
#
print 'wait'
print


for i in range(len(MACHINE)):
    m = MACHINE[i]
    print '''ssh %s 'cd %s/dbgen && 
                 ( for i in list??; do 
                     ( for j in $(< $i); do echo $j; gzip $j && aws s3 cp $j.gz s3://vitessedata/tpch/$j.gz --quiet; done ) & 
                   done ) && 
             wait'  &''' % (m, DATADIR)


#
#  WAIT FOR COMPLETION
#
print
print 'wait'
print
