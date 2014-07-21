## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "matrix" object
## that can cache its inverse. The idea here is to 
## send 'x', the matrix, to the alternate environment
## to allow the whole cached process to successfully
## take place.

## First, 'm' is the matrix you will enter
## for the cache later. It has a NULL vector.

makeCacheMatrix <- function(x = matrix()) {
    
    m <<- NULL
    set <- function(y){
        x <<- y
        m <<- NULL        
    }

## Second, assign the value x to get, which is a
## function that contains x. This allows R to know 
## that 'x' is the value it is supposed to get. 
    
    get <- function() x

## Third, set the matrix in place. At this point,
## R is supposed to solve for the inverse. The
## function 'solve', when used without any special
## parameters, uses an Identity Matrix to solve for
## the inverse.

    setmatrix <- function(solve) m <<- solve
    
## Fourth, ask R to get the solved matrix from the
## alternate environment, where the cached result
## is stored.

    getmatrix <- function() m
    
## 'List' creates a list to store the results as a
## cached list in the alternate environment.

    list(get = get, set = set,
         setmatrix = setmatrix,
         getmatrix = getmatrix)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {

## First off, R checks if the cached function is
## indeed working.
    
    m <- x$getmatrix()

## If the cached matrix does not return a NULL or
## NA value, it will return the cached inverse matrix.
## Otherwise, the solve function will be performed
## again, which means that the cache failed. The
## 'message' indicates that the cached data is
## indeed present.

    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setmatrix(m)
        m
}  
  
## Return a matrix that is the inverse of 'x'
