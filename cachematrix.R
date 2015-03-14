## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ix <- NULL
  set <- function(y) {
    # Constructor for matrix with cache
    x <<- y
    ix <<- NULL
  }
  get <- function() {
    # Getter for data
    x
  }
  setInverse <- function(Inv) {
    # Computes and caches the inverse
    ix <<- Inv
  }
  getInverse <- function() {
    # Getter for cached inverse
    ix
  }
  list(get=get, set=set, 
       getInverse=getInverse, 
       setInverse=setInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  Inv <- x$getInverse();
  if (!is.null(Inv)) {
    message("Getting cached data")
    return(Inv)
  }
  mat <- x$get()
  Inv <- solve(mat)
  x$setInverse(Inv)
  Inv
}
