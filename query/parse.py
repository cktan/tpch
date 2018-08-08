# given two files out0 and out1, run parse like this: 
#    python parse.py out0 out1
#
import fileinput
import operator

out = {}
def add_to_out(qnum, qsum):
    if qnum not in out:
	out[qnum] = []
    out[qnum].append(int(qsum))


qnum = 0
qsum = 0
for line in fileinput.input():
    line = line.split()
    if len(line) == 2 and line[0] == 'query':
	if (qnum): add_to_out(qnum, qsum)
	qnum = int(line[1])
	qsum = 0
	continue
    if len(line) == 3 and line[0] == 'Time:':
	msec = float(line[1])
	qsum += msec

if (qnum): add_to_out(qnum, qsum)

sorted_out = sorted(out.iteritems(), key=operator.itemgetter(0))
for x in sorted_out:
    qnum = x[0]
    qsum = x[1]
    print qnum, qsum[0], qsum[1],
    speedup = qsum[0]*1.0/qsum[1]
    if speedup < 0.9 or speedup > 1.2:
	print '%.2fx' % speedup
    else: 
	print '--'


