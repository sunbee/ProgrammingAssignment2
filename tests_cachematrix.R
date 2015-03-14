y <- c(1,2,3,0,1,4,5,6,0)
mm <- matrix(y, nrow=3)
mm

mms <- makeCacheMatrix(mm)
cacheSolve(mms)
cacheSolve(mms)
