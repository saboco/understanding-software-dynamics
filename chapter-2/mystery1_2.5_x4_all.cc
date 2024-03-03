// Sample mystery program to measure how long an add takes. Flawed.
// Copyright 2021 Richard L. Sites

#include <stdint.h>
#include <stdio.h>
#include <time.h>		// time()
#include "timecounters.h"

static const int kIterations = 10000;

uint64_t runSum()
{
  uint64_t sum = 0;

  time_t t = time(NULL);	// A number that the compiler does not know
  volatile uint64_t incr = t & 255;		// Unknown increment 0..255

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; i+=4) {
    sum += incr;
    sum += incr;
    sum += incr;
    sum += incr;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  fprintf(stdout, "addq: %d iterations, %lu cycles, %4.2f cycles/iteration\n", 
          kIterations, elapsed, felapsed / kIterations);

  return sum;
}

uint64_t runMul()
{
  uint64_t prod = 1;

  volatile int incr = 3;		// Unknown increment 0..255

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; i+=4) {
    prod *= incr;
    prod *= incr;
    prod *= incr;
    prod *= incr;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  fprintf(stdout, "mulq: %d iterations, %lu cycles, %4.2f cycles/iteration\n", 
          kIterations, elapsed, felapsed / kIterations);

  return prod;
}

uint64_t runDiv()
{
  uint64_t quotient = 18446744073709551615u;

  volatile int incr = 2;		// Unknown increment 0..255

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; i+=4) {
    quotient /= incr;
    quotient /= incr;
    quotient /= incr;
    quotient /= incr;
    quotient += 64u;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  fprintf(stdout, "divq: %d iterations, %lu cycles, %4.2f cycles/iteration\n", 
          kIterations, elapsed, felapsed / kIterations);

  return quotient;
}

// ----------------- doubles --------------------


double runSumf()
{
  double sum = 0;

  time_t t = time(NULL);	// A number that the compiler does not know
  volatile int incr = t & 255;		// Unknown increment 0..255
  double incrf = incr;

  int64_t startcy = GetCycles();
  for (int i = 0; i < kIterations; i+=4) {
    sum += incrf;
    sum += incrf;
    sum += incrf;
    sum += incrf;
  }

  int64_t elapsed = GetCycles() - startcy;
  double felapsed = elapsed;

  fprintf(stdout, "fadd: %d iterations, %lu cycles, %4.2f cycles/iteration\n", 
          kIterations, elapsed, felapsed / kIterations);

  return sum;
}

double runMulf()
{
  double prod = 1;

  volatile double incrf = 1.043;		// Unknown increment 0..255

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
  double quotient = 1.79769313486231E+308;

  volatile double incrf = 1.033;		// Unknown increment 0..255

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
  
  uint64_t sum = runSum();
  uint64_t mul = runMul();
  uint64_t div = runDiv();

  double sumf = runSumf();
  double mulf = runMulf();
  double divf = runDivf();

  bool print = 0;
  
  if(print || time(NULL) == 0){
    fprintf(stdout, "sum %lu\n", sum);	// Make sum live
  }

  if(print || time(NULL) == 0){
    fprintf(stdout, "mul %lu\n", mul);	// Make sum live
  }

  if(print || time(NULL) == 0){
    fprintf(stdout, "div %lu\n", div);	// Make sum live
  }

  if(print || time(NULL) == 0){
    fprintf(stdout, "sumf %4.2f\n", sumf);	// Make sum live
  }

  if(print || time(NULL) == 0){
    fprintf(stdout, "mulf %4.2f\n", mulf);	// Make sum live
  }

  if(print || time(NULL) == 0){
    fprintf(stdout, "divf %4.2f\n", divf);	// Make sum live
  }


  return 0;
}