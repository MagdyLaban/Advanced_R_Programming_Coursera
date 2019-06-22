# Advanced_R_Programming_Coursera
1. Part 1: Factorial Function
   * For this Part you will need to write four different versions of the Factorial function:
      + Factorial_loop: a version that computes the factorial of an integer using looping (such as a for loop)
      + Factorial_reduce: a version that computes the factorial using the reduce() function in the purrr package. Alternatively, you can          use the Reduce() function in the base package.
      + Factorial_func: a version that uses recursion to compute the factorial.
      + Factorial_mem: a version that uses memoization to compute the factorial.
After writing your four versions of the Factorial function, use the microbenchmark package to time the operation of these functions and provide a summary of their performance. In addition to timing your functions for specific inputs, make sure to show a range of inputs in order to demonstrate the timing of each function for larger inputs.
***
2. Part 2: Longitudinal Data Class and Methods
    * The purpose of this part is to create a new class for representing longitudinal data, which is data that is collected over time on a      given subject/person. This data may be collected at multiple visits, in multiple locations. You will need to write a series of            generics and methods for interacting with this kind of data.
    * The data for this part come from a small study on indoor air pollution on 10 subjects. Each subject was visited 3 times for data          collection. Indoor air pollution was measured using a high-resolution monitor which records pollutant levels every 5 minutes and the      monitor was placed in the home for about 1 week. In addition to measuring pollutant levels in the bedroom, a separate monitor was          usually placed in another room in the house at roughly the same time.
