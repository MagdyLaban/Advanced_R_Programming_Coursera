Factorial_loop <- function(n)
{
  factorial <- 1
  if( n==0 ) {
    return(1) 
  }
  else if (n < 0) {
    stop("No factorial for navigate numbers")
  }
  else
  {
    for (i in 1:n) {
      factorial <- factorial * i 
    }
    print(factorial)
  }
}  
 Factorial_reduce <- function (n)
{
  if (n == 0){ 
  return(1)
  }
  else if(n < 0) {
     stop("No factorial for negative numbers")
  }
  else{
  factorial <- reduce(as.numeric(1:n), `*`)
  return(factorial)
  }
}
Factorial_func <- function(n){
  if(n == 0){
    return(1)
  }
  else if(n < 0){
    stop("No factorial for negative numbers")
  }
  else{
    factorial <- n * Factorial_func(n-1)
    return(factorial)
  }
}  
Factorial_mem <- function(n) {
  if (n == 0) {
    return(1)
  }
  else if(n < 0){
    stop("No factorial for negative numbers")
  }
  else {
    fact_tabel[n] <<- n * Factorial_mem(n-1)
    return(fact_tabel[n])
  }
}
Fac <- as.integer(readline())
fact_table <- c(rep(NA, Fac))