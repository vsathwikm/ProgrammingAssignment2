## The below given functions together solve and cache the inverse of a matrix

## This function creates a special matrix object which caches the inverse of the matrix

  makeCacheMatrix <- function(x=matrix()){
    m=NULL
    set<-function(y){
      x <<- y
      m <<- NULL
    }
    get<-function()x
    setinverse<-function(inverse) m<<-inverse
    getinverse<-function()m
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
  }


## This function solves for the inverse of a matrix or caches the inverse if it is already solved

  cachesolve <- function(x=matrix(),...){
    m<-x$getinverse()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    inverse<-x$get()
    m<-solve(inverse)
    x$setinverse(m)
    m
  }

## Example to test the operation of above functions
  
a<-makeCacheMatrix(matrix(c(1,2,4,6),nrow=2,ncol=2))
cachesolve(a)
  
  