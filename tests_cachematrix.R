y <- c(1,2,3,0,1,4,5,6,0)
mm <- matrix(y, nrow=3)
mm

mms <- makeCacheMatrix(mm)
cacheSolve(mms)
cacheSolve(mms)

z <- c(4,5,6,6,5,4,4,6,5)
nn <- matrix(z, nrow=3)
mms$set(nn)
mms$get()
cacheSolve(mms)
cacheSolve(mms)


