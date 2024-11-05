
<!-- README.md is generated from README.Rmd. Please edit that file -->

# libminer

<!-- badges: start -->

[![R-CMD-check](https://github.com/torkjot/libminer/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/torkjot/libminer/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of libminer is to …

## Installation

You can install the development version of libminer from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("torkjot/libminer")
```

## Example usage

To get a count of installed packages in each of your library locations,
optionally with the total sizes, use the `lib_summary()` function:

``` r
library(libminer)
lib_summary()
#>                                                                       Library
#> 1                                          C:/Program Files/R/R-4.4.1/library
#> 2                          C:/Users/KITCHINGT/AppData/Local/R/win-library/4.4
#> 3 C:/Users/KITCHINGT/AppData/Local/Temp/1/RtmpmAHEHX/temp_libpathebdc119d62db
#>   n_packages
#> 1         29
#> 2        100
#> 3          1
```
