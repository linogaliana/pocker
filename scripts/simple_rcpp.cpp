#include <Rcpp.h>
#include <Rcpp/Benchmark/Timer.h>

using namespace Rcpp;

// [[Rcpp::export]]
double cumsum_cpp(int n) {
  
  // start the timer
  Timer timer;
  timer.step("start");        // record the starting point
  
  NumericVector x = runif(n);
  
  for (int i = 1 ; i < x.length() ; i++){
    x[i] += x[i-1];
  }
  
  timer.step("end");   // record the final step    
  
  
  NumericVector res(timer);   // 
  for (int i=0; i<res.size(); i++) {
    res[i] = res[i] / n;
  }
  return (res[1]-res[0])/1000; // Milliseconds    
  
}
