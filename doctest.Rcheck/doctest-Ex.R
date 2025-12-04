pkgname <- "doctest"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('doctest')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("dt_roclet")
### * dt_roclet

flush(stderr()); flush(stdout())

### Name: dt_roclet
### Title: Create the doctest roclet
### Aliases: dt_roclet

### ** Examples

## Not run: 
##D roxygen2::roxygenize(roclets = "doctest::dt_roclet")
## End(Not run)



cleanEx()
nameEx("test_doctests")
### * test_doctests

flush(stderr()); flush(stdout())

### Name: test_doctests
### Title: Test doctests in a package
### Aliases: test_doctests

### ** Examples

## Not run: 
##D   test_doctests()
## End(Not run)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
