## `makeCacheMatrix` creates a special matrix that saves both every matrix 
## entry and the inverse of matrix if has been computed

## Usage: 
## > mat <- makeCacheMatrix()
## > mat$set(y)

makeCacheMatrix <- function(x = matrix()) {
        ## Return a special matrix
        i <- NULL
        set <- function(y) {
            x <<- y
            i <<- NULL
        }
        get <- function() x
        setinv <- function(x) i <<- x
        getinv <- function() i
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## `cacheSolve` computes the inverse of the specical matrix created by the 
## above function `makeCacheMatrix`. Before computing, it first checkes if 
## inverse of the object has been computed. If so, it will return the value
## directly, otherwise it will compute

## Usage:
## > mat_inv <- cacheSolve(mat)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        temp <- x$getinv()
        if(is.null(temp)) {
                temp <- solve(x$get(), ...)
                temp <- x$setinv(temp)
                return(temp)
        }
        message("getting cached data")
        return(temp)
}
