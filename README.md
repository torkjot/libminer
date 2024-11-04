
<!-- README.md is generated from README.Rmd. Please edit that file -->

# libminer

<!-- badges: start -->
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
#> 1                                          C:/Program Files/R/R-4.3.2/library
#> 2                          C:/Users/KITCHINGT/AppData/Local/R/win-library/4.3
#> 3 C:/Users/KITCHINGT/AppData/Local/Temp/1/RtmpcJK7lW/temp_libpath51647df27c8e
#>   n_packages
#> 1         29
#> 2        278
#> 3          1
```
