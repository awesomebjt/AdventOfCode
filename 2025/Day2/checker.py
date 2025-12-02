import os,sys

def invalid(id):
    if len(id) % 2 != 0:
        return 0
    first = id[:int(len(id)/2)]
    last  = id[int(len(id)/2):]
    if int(first)==int(last):
        return int(id)
    else:
        return 0

if __name__ == "__main__":
    filename = sys.argv[1]
    f = open(filename,'r')
    content = f.read().strip()
    invalid_ids = []
    invalid_tally = 0
    ranges = [(r.split('-')[0],r.split('-')[1]) for r in content.split(',')]

    for x,y in ranges:
        for n in range(int(x),int(y)+1):
            id_str = str(n)
            invalid_tally += invalid(id_str)
    print(invalid_tally)
