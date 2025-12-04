## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = FALSE, results = "asis"-------------------------------------------
rox <- r"--[
#' Fibonacci function 
#' 
#' @param n Integer
#' @return The nth Fibonacci number
#' 
#' @doctest
#'
#' @expect type("integer")
#' fib(2)
#'
#' n <- 6 
#' @expect equal(8)
#' fib(n)
#' 
#' @expect warning("not numeric")
#' fib("a")
#'
#' @expect warning("NA")
#' fib(NA)
fib <- function (n) {
  if (! is.numeric(n)) warning("n is not numeric")
  ...
}
]--"
cat(rox)

## ----echo = FALSE, warning = FALSE, comment=""--------------------------------
library(doctest)
library(roxygen2)
results <- roc_proc_text(dt_roclet(), rox)
roclet_output(dt_roclet(), results)

## ----echo = FALSE, warning = FALSE, comment=""--------------------------------
results <- roc_proc_text(rd_roclet(), rox)
text <- format(results[[1]])
cat(gsub(".*\\\\examples", "\\\\examples", text))

