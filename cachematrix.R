## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  -
## @x: a square invertible matrix
## return: a list containing functions to set matrix, get matrix,set the inverse matrix,get the inverse matrix
##   this list is used as the input to cacheSolve()

+  inv = NULL
+  set = function(y) {
## use <<- operator which can be used to assign a value to an object in an environment that is different from the current environment
+    x <<- y
+    inv <<- NULL    }
+  get = function() x
+  setinv = function(inverse) inv <<- inverse 
+  getinv = function() inv
+  list(set=set, get=get, setinv=setinv, getinv=getinv)
}
## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##   If the inverse has already been calculated (and the matrix has not changed), 
##     then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
-        ## Return a matrix that is the inverse of 'x'
## @x: output of makeCacheMatrix()
## return: inverse of the original matrix input to makeCacheMatrix()
+  
+  inv = x$getinv()
+  
## if the inverse has already been calculated
 +  if (!is.null(inv)){
## get it from the cache and skips the computation. 
+    message("getting cached data")
+    return(inv)
}
+  # otherwise, calculates the inverse 
+  mat.data = x$get()
+  inv = solve(mat.data, ...)
+  
## sets the value of the inverse in the cache via the setinv function.
+  x$setinv(inv)
+  
+  ## Return a matrix that is the inverse of 'x'
+  return(inv)  
  }