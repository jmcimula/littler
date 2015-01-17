#!/usr/bin/env r
#
# Another example tp check one or more packages, with option parsing
#
# Copyright (C) 2011 - 2015  Dirk Eddelbuettel
#
# Released under GPL (>= 2)

## load docopt package from CRAN
suppressMessages(library(docopt))       # we need docopt (>= 0.3) as on CRAN

## configuration for docopt
doc <- "Usage: check.r [-h] [--as-cran] [TARGZ ...]

-a --as-cran        customization similar to CRAN's incoming [default: FALSE]
-h --help           show this help text"

## docopt parsing
opt <- docopt(doc)

args <- character()
if (opt$`as-cran`) args <- c(args, "--as-cran")


## helper function 
checkArg <- function(p, args) {
    tools:::.check_packages(c(p, args))
}

## installation given selected options and arguments
sapply(opt$TARGZ, checkArg, args)
