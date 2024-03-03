// Sample mystery program to measure how long an add takes. Flawed.
// Copyright 2021 Richard L. Sites

#include <stdint.h>
#include <stdio.h>
#include <time.h>		// time()
#include "timecounters.h"

static const int kIterations = 1000000;

double runMulf()
{
  double prod = 1.79769313486230E+308;

  volatile double incrf = 1.043;

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; i+=4) {
    prod *= incrf;
    prod *= incrf;
    prod *= incrf;
    prod *= incrf;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  fprintf(stdout, "fmul: %d iterations, %lu cycles, %4.2f cycles/iteration\n", 
          kIterations, elapsed, felapsed / kIterations);

  return prod;
}

double runDivf()
{
  double quotient = 1.79769313486230E+308;

  volatile double incrf = 0.2;

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; i+=4) {
    quotient /= incrf;
    quotient /= incrf;
    quotient /= incrf;
    quotient /= incrf;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  fprintf(stdout, "fdiv: %d iterations, %lu cycles, %4.2f cycles/iteration\n", 
          kIterations, elapsed, felapsed / kIterations);

  return quotient;
}


int main (int argc, const char** argv) { 
  
  double mulf = runMulf();
  double divf = runDivf();

  bool print = 0;
  
  if(print || time(NULL) == 0){
    fprintf(stdout, "mulf %4.2f\n", mulf);	// Make sum live
  }

  if(print || time(NULL) == 0){
    fprintf(stdout, "divf %4.2f\n", divf);	// Make sum live
  }

  return 0;
}