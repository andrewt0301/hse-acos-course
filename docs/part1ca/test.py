import argparse
import random as rng
from enum import Enum
import datetime

I_RANGE = [i for i in range(-9, 9) if i != 0 and i != 1 and i != -1]
POLYNOMIAL_DEGREE = 7


class range_type(Enum):
    LESS = 0
    INTERVAL = 1
    MORE = 2


class f_range:
    def __init__(self, t, a=0, b=0):
        if a > b:
            a, b = b, a
        self.t = t
        self.a = a
        self.b = b

    def string(self):
        if self.t == range_type.LESS:
            return f"x <= {self.a}"
        elif self.t == range_type.INTERVAL:
            return f"{self.a} < x <= {self.b}"
        elif self.t == range_type.MORE:
            return f"{self.b} < x"
        else:
            return "NaN"


class f_poly:
    def __init__(self, v=[]):
        self.v = v
        while True:
            zeros = [rng.randint(2, len(v) - 1) for _ in range(4)]
            if len(set(zeros)) > 3:
                break
        for i in zeros:
            self.v[i] = 0

    def string(self):
        s = ""
        for i, v in enumerate(self.v):
            if v == 0:
                continue
            if i != 0:
                s = f" * x**{i}" + s if i != 1 else f" * x"
            s = str(abs(v)) + s
            if v < 0:
                s = " - " + s
            if v > 0:
                s = " + " + s
        return s[3:]


class f_exp:
    def __init__(self, a=0, b=0):
        self.a = a
        self.b = b

    def string(self):
        return f"{self.a}**x {'-' if self.b < 0 else '+'} {abs(self.b)}"


class f_linear:
    def __init__(self, a=0, b=0):
        self.a = a
        self.b = b

    def string(self):
        return f"{self.a} * x {'-' if self.b < 0 else '+'} {abs(self.b)}"


class f_const:
    def __init__(self, a=0):
        self.a = a

    def string(self):
        return f"{self.a}"


def rnd_function(f_type):
    if f_type == 3:
        return f_exp(rng.choice(I_RANGE), rng.choice(I_RANGE))
    elif f_type == 2:
        return f_poly([rng.choice(I_RANGE) for _ in range(POLYNOMIAL_DEGREE + 1)])
    elif f_type == 1:
        return f_linear(rng.choice(I_RANGE), rng.choice(I_RANGE))
    else:
        return f_const(rng.choice(I_RANGE))


def parse_arguments():
    prog_info = "Variant generator for first final test of ACOS course"
    parser = argparse.ArgumentParser(description=prog_info)
    parser.add_argument("-g", "--group", required=True,
                        help="The number of the group")
    parser.add_argument("-n", "--number", required=True,
                        help="The number students in the group")
    parser.add_argument("-s", "--seed", default='',
                        help="Seed for random numbers generator. Default: timestamp")
    args = parser.parse_args()
    return args


if __name__ == "__main__":
    args = parse_arguments()
    rng.seed(f"ACOS_{datetime.date.today().year}_{args.group}_{args.number}:{args.seed}")
    print(f"Variants: Group {args.group}")
    print("---")
    print("")
    print("__NOTE__: _Value range for testing is_ `0 <= x <= 15`.")
    print("")
    print("__HINT__: _You can use Python to calculate correct results of `f(x)` to be used for checking._")
    print("")
    for i in range(int(args.number)):
        while True:
            intervals = [rng.choice(I_RANGE) for _ in range(3)]
            if len(set(intervals)) > 2:
                break
        intervals.sort()

        f_types = [0, 1, 2, 3]
        while True:
            rng.shuffle(f_types)
            task = [(i, rnd_function(f), f) for i, f in enumerate(f_types)]
            if task[2][2] != 3:
                break

        nums = sorted(rng.sample(range(2, 11), 3))
        conds = [f"x < {nums[0]}", f"x >= {nums[0]}", f"x == {nums[1]}", f"x > {nums[2]}"]
        print(f"{i+1}. Function `f(x)` that handles cases:")
        print("")
        print("    ```")
        j = 0
        for f in task:
            print(f"    f(x) = {f[1].string()} if {conds[j]}")
            j = j + 1
        print("    ```")
        print("")
