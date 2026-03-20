import random

ca = []
os = []
pr = []

while not input("Generate next variant? Press Enter or type any character to stop. "):
    if not ca:
        ca = [x for x in range(1, 15)]
        random.shuffle(ca)
    if not os:
        os = [x for x in range(1, 13)]
        random.shuffle(os)
    if not pr:
        pr = [x for x in range(1, 25)]
        random.shuffle(pr)
    print("CA=%d OS=%d PR=%d" % (ca.pop(0), os.pop(0), pr.pop(0)))
