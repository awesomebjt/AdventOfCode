import os,sys

def invalid(id):
    l = len(id)
    for i in range(l-1,0,-1):
        # i is a divisor. If length is 10, we go through
        # chunk sizes from 5 to 1
        chunks = [id[j:j+i] for j in range(0,l,i)]
        if len(set(chunks)) == 1:
            return True
    return False


if __name__ == "__main__":
    filename = sys.argv[1]
    f = open(filename,'r')
    content = f.read().strip()
    invalid_ids = []
    invalid_tally = 0
    ranges = [(r.split('-')[0],r.split('-')[1]) for r in content.split(',')]
    for x,y in ranges:
        for n in range(int(x),int(y)+1,1):
            id_str = str(n)
            if invalid(id_str):
                invalid_tally += n
    print(invalid_tally)
