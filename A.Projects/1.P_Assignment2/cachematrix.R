# Below I write two R functions that can cache time-consuming computations using 
# superassignment operator.If the contents of a matrix is not changing, I cache 
# the value of the matrix so that when we need it again, it can be looked up in 
# the cache rather than computing again.

# First function takes a matrix and stores it, and caches its inverse.
# This function returns a list of functions to set the value of the matrix, 
# get the matrix, set the inverse value of the matrix and get the inverse 
# of the matrix
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() {x}
    setInverse <- function(inverse) {
        inv <<- inverse} 
    getInverse <- function() {inv}
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


# This function take a matrix, check if its inverse is cached, if not,
# takes the inverse of the matrix, set the value of the matrix and 
# returns the inverse the of the matrix 

cachesolve <- function(x, ...) {
    inv <- x$getInverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    matrice <- x$get()
    inv <- solve(matrice, ...)
    x$setInverse(inv)
    inv
}

