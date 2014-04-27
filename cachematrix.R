## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#This function implements 4 basic parts- the set,get, 
#setinverse,getinverse portions
#Not much of the actual portion of the program happens here
#The second function uses the portions defined here to retrieve the necessary values
#Sets the matrix, Gets the matrix, Sets the inverse of the matrix, Gets the corresponding inverse
makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) m <<- solve
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## Write a short comment describing this function
#The function basically checks to see first if a cached value is already present for the given matrix. If present, it retrieves it from the cache itself. Otherwise it computes it before returning
#First query the vector- x's cache
#If present, return it. No further work is needed
#If not present, then compute the inverse here
#Save the result back in x's cache so that it can be used if called again
#Finally, return the result
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
      m
}
