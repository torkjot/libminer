#' Provide Number of R Packages by Library
#'
#' Provide the number of R package by library in
#'  a data.frame
#'
#' @param sizes Should sizes of libraries be calculated. Default 'FALSE'.
#' can be accessed through insert roxygen skeleton
#' name of parameter and document what it does
#'
#' @return a data.frame of R packages by library
#' @export
#'
#' @examples
#' lib_summary()

lib_summary <- function(sizes = FALSE) {
  if (!is.logical(sizes)) {
    stop("'sizes' must be logical (TRUE or FALSE)")
  }

# Original method
  # pkgs <- utils::installed.packages() # What packages are installed in sys
  #   # in a raw format
  # pkg_tbl <- table(pkgs[, "LibPath"]) # Pull out one column
  #   # and summarize it into a table by unique values
  # pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
  #   # convert into a dataframe and convert into factors

# Using helper function (see below)
  pkg_df <- lib()
  pkg_tbl <- table(pkg_df[, "LibPath"])
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)

  names(pkg_df) <- c("Library", "n_packages")


  if (isTRUE(sizes)) {
    # pkg_df$lib_size <- vapply( # for each row in the library
    #   pkg_df$Library,
    #   function(x) {
    #     sum(fs::file_size(fs::dir_ls(x, recurse = TRUE)))
    #       # list all files recursively and determine their size and sum them
    #   },
    #   FUN.VALUE = numeric(1) # ensures that the value of the sum is numeric
    # )
    pkg_df$lib_size <- map_dbl( # for each row in the library
      pkg_df$Library,
      \(x) sum(fs::file_size(fs::dir_ls(x, recurse = TRUE)))
        # anonymous functions syntax - just used in this context and then
        # is thrown away
    )
  }

  pkg_df # return the package data.frame
}

# load using devtools::load_all() - as it loads to memory
  # OR USE SHORTCUT: Ctrl-Shift-L
# library takes from Installed to Memory
# devtools goes Source to Memory

# ctrl-shift-d is shortcut to run documentation - will turn roxygen comment
  # into documentation to get to by ?function()

#' Generate a data.frame of installed packages
#'
#' @return data.frame of all packages installed on a system
#' @export
lib <- function() {
  pkgs <- utils::installed.packages()
  as.data.frame(pkgs, stringsAsFactors = FALSE)
}

#' Generate sizes
#'
#' @param df a data.frame
#' @return data.frame with lib_size column
#' @noRd
calculate_sizes <- function(df) {
  df$lib_size <- map_dbl(
    df$Library,
    \(x) sum(fs::file_size(fs::dir_ls(x, recurse = TRUE)))
  )
  df
}
