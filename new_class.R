# Define the class
setClass(
  "binary_vector",
  contains = "numeric"
)

# Define validity method
setValidity(
  "binary_vector",
  function(object) {
    if (!all(object %in% c(0, 1))) {
      return("binary_vector can only contain 0s and 1s.")
    }
    TRUE
  }
)

# Define coercion from character
setAs(
  "character",
  "binary_vector",
  function(from) {
    numeric_vals <- as.numeric(from)
    new("binary_vector", numeric_vals)
  }
)

# Define generic function
setGeneric(
  "add_vector",
  function(x, y) standardGeneric("add_vector")
)

# Define method for adding two binary_vectors
setMethod(
  "add_vector",
  signature(x = "binary_vector", y = "binary_vector"),
  function(x, y) {
    if (length(x) != length(y)) stop("Binary vectors must be of the same length.")
    result <- (x + y) %% 2
    new("binary_vector", as.numeric(result))
  }
)



################################################################################
## Some test cases

## Create a new vector
#x <- new("binary_vector", c(0, 1, 1, 0, 0))

## This should fail with an error
#x <- new("binary_vector", c(0, 1, 1, 0, 2))

## This should fail with an error
#x <- new("binary_vector", c(0, 1, -1, 0, 0))

## Coerce from a character vector
x <- as(c("0", "1", "1", "0", "0", "1"), "binary_vector")
y <- new("binary_vector", c(1, 1, 0, 0, 1, 0))

## Add two binary vectors
z <- add_vector(x, y)
z  ## should be c(1, 0, 1, 0, 1, 1)
print(z)
