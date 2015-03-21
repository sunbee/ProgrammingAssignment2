## A special cachable-matrix that
## saves the computed inverse to save time, unless/until
## the data are changed.

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

# TESTS
# Set up data
y <- c(1,2,3,0,1,4,5,6,0)
mm <- matrix(y, nrow=3)
mm
# Make an instance of cache-able matrix
mms <- makeCacheMatrix(mm)
# Solve for inverse .. once
cacheSolve(mms)
# .. and again.
cacheSolve(mms)
# Change the data
z <- c(4,5,6,6,5,4,4,6,5)
nn <- matrix(z, nrow=3)
mms$set(nn)
mms$get() # What did we change it to?
# Solve for inverse ..
cacheSolve(mms)
# .. and again.
cacheSolve(mms)

