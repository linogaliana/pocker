# First, check it works in R files


print(Sys.which("python"))
Sys.setenv(RETICULATE_PYTHON = "/opt/conda/envs/base/bin")

print(Sys.which("python"))
print(reticulate::py_config())



### METHODE 1: INTERACTIVE SESSION

reticulate::repl_python()
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
quit

### METHODE 2: SOURCING FILE

reticulate::source_python("simple_script.py")
