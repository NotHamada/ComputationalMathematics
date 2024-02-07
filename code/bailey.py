import matplotlib.pyplot as plt
import numpy as np
import math

ln2 = 0.69314718055994537
e = 2.718281828459045

def pow(x, y):
    aux = 1
    for i in range(y):
        aux *= x
    return aux

def Horner(x):
    return 1 + x * (1 + x * (1/2 + x * (1/6 + x * (1/24 + x * (1/128)))))

def Bailey(x):
    n = math.ceil((x - ln2/2)/ln2)
    r = (x - n * ln2)/256
    return pow(2, n) * pow((pow(e, int(r)) * Horner(r - int(r))), 256)

x = [i for i in np.arange(0, 10, 0.05)]
diff = [abs(math.exp(i) - Bailey(i)) for i in x]

plt.figure().set_figwidth(10)
plt.plot(x, diff, label='|e^x - Bailey(x)|')
plt.xlabel('x')
plt.ylabel('Error')
plt.title('Bailey vs e^x')
plt.legend()

plt.savefig('Bailey.png', dpi=300, bbox_inches='tight')
# plt.show()