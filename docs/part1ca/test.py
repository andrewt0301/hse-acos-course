import random as rng
from enum import Enum

I_RANGE = [i for i in range(-10, 11) if i is not 0]
POLYNOMIAL_DEGREE = 8


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
                s = f" * x^{i}" + s if i != 1 else f" * x"
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
        return f"{self.a}^x + {self.b}"


class f_linear:
    def __init__(self, a=0, b=0):
        self.a = a
        self.b = b

    def string(self):
        return f"{self.a} * x + {self.b}"


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


if __name__ == "__main__":
    rng.seed("ACOS_Spring2021_193_2")
    for i in range(100):
        f_types = [0, 1, 2, 3]
        rng.shuffle(f_types)
        while True:
            intervals = [rng.choice(I_RANGE) for _ in range(3)]
            if len(set(intervals)) > 2:
                break
        intervals.sort()
        task = [(i, rnd_function(f), i) for i, f in enumerate(f_types)]

        nums = sorted(rng.sample(range(1, 10), 3))
        conds = [f"x < {nums[0]}", f"x >= {nums[0]}", f"x == {nums[1]}", f"x > {nums[2]}"]
        print(f"Variant #{i}:")
        print("1.")
        print("        ```")
        j = 0
        for f in task:
            print(f"        f(x) = {f[1].string()} if {conds[j]}")
            j = j + 1
        print("        ```")
