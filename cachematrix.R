## makecachematrix returns a list of functions, which create an object for storing the matrix and its inverse
## cachesolve takes the output from makecachematrix and either calculates inverse or retrives inverse from cache


## makecachematrix returns a list of functions - get, setinv, getinv

makecachematrix <- function (x = matrix ()) {
	inv <<- NULL
	set <- function(y) {
                
		x <<- y

                inv <<- NULL

        }
	get <- function () {x}
	setinv <- function (inverse) {
	inv <<- inverse}
	getinv <- function () inv
	list (get = get, setinv = setinv, getinv = getinv)
}



## cachesolve either calculates inverse and updates the cache or retrives the inverse from cache
## cachesolve function first checks if the inverse of the matrix exists in the cache. If the inverse exists in the cache, that means inverse need not be calculated

cachesolve <- function (x) {
	inv <- x$getinv()
	if (!is.na(inv)){
		print "Getting cached inverse matrix"
		return (inv) 
	}
	data <- x$get()
	inv <- solve(data)
        
	x$setinv(inv)

        inv
}
