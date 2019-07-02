import numpy as np
import time
import statistics

def test(n = 1000): 
  start = time.time()
  x = np.random.uniform(0,1,n)
  for i in range(n):
    x[i] = x[i] + 1
  end = time.time()
  return(end - start)

exec_time_python = [test(100000) for k in range(100)]


print(statistics.median(exec_time_python*1000))
