## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# library(pracma)


makeCacheMatrix <- function(x = matrix()) {
    inv_mx <- NULL
    
    set <- function(mx){x <<- mx}
    
    get <- function() x
    
    set_inv <- function(inv_mtrx) {inv_mx <<- inv_mtrx}
    
    get_inv <- function() inv_mx
    
    list(set=set, get=get, set_inv=set_inv, get_inv=get_inv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv_mtrx <- x$get_inv()
    if(!is.null(inv_mtrx)){
        message("Loaded inverse matrix from cache.")
        return(inv_mtrx)
    }
    inv_mtrx <- solve(x$get(), ...)
    x$set_inv(inv_mtrx)
    inv_mtrx
}
