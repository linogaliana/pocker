import numpy as np
import datetime
import statistics

def test(n = 1000): 
  start = datetime.datetime.now()
  x = np.random.uniform(0,1,n)
  for i in range(1,n):
    x[i] += x[i-1]
  end = datetime.datetime.now()
  c = end - start
  return(c.microseconds/1000)

exec_time_python = [test(100000) for k in range(100)]

print("Time for a cumulative sum over a vector of size 1000 (milliseconds):")
print(statistics.median(exec_time_python))

