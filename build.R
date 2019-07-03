
print("=============================================")
print("CHECKING RETICULATE WORKS FINE")


# First, check it works in R files
# ---------------------------------------

# Sys.setenv(RETICULATE_PYTHON = "/opt/conda/bin")

print(" ---------- PYTHON PATH IN RSESSION:")
print(Sys.which("python"))
print(reticulate::py_config())



### METHOD 1: INTERACTIVE SESSION

print(" ---------- CHECK 1: OPEN PYTHON INTERPRETER INSIDE RSESSION")

reticulate::repl_python()
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

print("Time for a Fibonacci series over a vector of size 1000 (milliseconds):")
print(statistics.median(exec_time_python))
quit

### METHOD 2: SOURCING FILE

print(" ---------- CHECK 2: SOURCE PYTHON FILES INSIDE R")


reticulate::source_python("simple_script.py")




### METHOD 3: RMARKDOWN