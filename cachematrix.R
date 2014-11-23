## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function takes a numericmatrix as input and returns a list of functions
# to set/get values of the matrix/inverse matrix. The data is also cached
# inside these functions.
makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
        x <<- y
        m <<- NULL
      }
      get <- function() x
      setInverse <- function(inverse) m <<- inverse
      getInverse <- function() m
      list(set = set, get = get,
           setInverse = setInverse,
           getInverse = getInverse)
}


## Write a short comment describing this function
# This function takes the object containing the get/set functions as input and returns
# the inverse of the matrix if not already computed.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)) {
          message("getting cached data")
          return(m)
        }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}

##For my understanding, I did the following test on a 1000 x 1000 matrix.

## Creating a square matrix
# set.seed(88)
# a <- matrix(sample(1:1000, 1000000, replace=T),1000,1000)

## Crearing a set of functions to cache the matrix and it's inverse
# cacheTmp <- makeCacheMatrix(a)

## Running cacheSolve function for the first time. t1 is the time taken
## for running
# t1 <- proc.time()
# res <- cacheSolve(cacheTmp)
# t1 <- proc.time() - t1

## Running cacheSolve function for the second time. t2 is the time taken
## for running the task 2nd time.
# t2 <- proc.time()
# res <- cacheSolve(cacheTmp)
# t2 <- proc.time() - t2

## Value of t1 (i.e. when inverse was NOT cached) = 13 sec
## Value of t1 (i.e. when inverse was cached) = 0 sec