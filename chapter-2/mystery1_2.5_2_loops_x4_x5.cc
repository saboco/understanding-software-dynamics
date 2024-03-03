// Sample mystery program to measure how long an add takes. Flawed.
// Copyright 2021 Richard L. Sites

#include <stdint.h>
#include <stdio.h>
#include <time.h>		// time()
#include "timecounters.h"

static const int kIterations = 1000 * 1000000;

int main (int argc, const char** argv) { 
  uint64_t sum = 0;

  time_t t = time(NULL);	// A number that the compiler does not know
  volatile int incr = t & 255;		// Unknown increment 0..255

  int64_t startcy1 = GetCycles();
  for (int i = 0; i < kIterations; i+=4) {
    sum += incr;
    sum += incr;
    sum += incr;
    sum += incr;
  }
  int64_t elapsed1 = GetCycles() - startcy1;

  int64_t startcy2 = GetCycles();
  for (int i = 0; i < kIterations; i+=5) {
    sum += incr;
    sum += incr;
    sum += incr;
    sum += incr;
    sum += incr;
  }
  int64_t elapsed2 = GetCycles() - startcy2;

  int64_t elapsed = elapsed1 - elapsed2;
  double felapsed = elapsed;
  
  fprintf(stdout, "%d iterations, %lu cycles, %4.2f cycles/iteration\n", 
          kIterations, elapsed, felapsed / kIterations);
  
  fprintf(stdout, "%lu %lu\n", t, sum);	// Make sum live

  return 0;
}
