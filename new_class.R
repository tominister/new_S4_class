## New Class

## Class for numeric vectors that only contain 1s and 0s
setClass(
    Class = "binary_vector",
    contains = "numeric"
)

## Validity method for 'binary_vector' -- there should only be 0s and 1s
setValidity(
    Class = "binary_vector",
    method = function(object) {
        ## Complete this function
    }
)

## Coerce method from character --> binary_vector
setAs(
    from = "character",
    to = "binary_vector",
    def = function(from) {
        ## Complete this function
    }
)

## Adding two binary_vectors using binary arithmetic
## 1 + 1 = 0
## 1 + 0 = 1
## 0 + 1 = 1
## 0 + 0 = 0

## Generic function for adding two vectors
setGeneric(
    "add_vector",
    ## Complete the rest of the generic function definition
)

## Specific method function for adding two binary vectors
setMethod(
    "add_vector",
    ## Complete the rest of the method function definition
)

