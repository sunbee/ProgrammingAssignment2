## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## The function to create a cache-able matrix, which
## returns a list of four functions, to
## set - stash the data in cache 
## get - retrieve the data from cache
## setInverse - stash the inverse in cache memory
## getInverse - retrieve the inverse from cache 
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
## The function to utilize the caching feature of a special matrix
## created with 'makeCacheMatrix' above.
## This checks to see if cache has data, before computing the inverse
## and stashing the result in cache. Once computed, the operation need never
## be repeated as the result is simply obtained from the cache.
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
