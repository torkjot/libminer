lib_summary <- function() {
  pkgs <- utils::installed.packages() # What packages are installed in sys
    # in a raw format
  pkg_tbl <- table(pkgs[, "LibPath"]) # Pull out one column
    # and summarize it into a table by unique values
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
    # convert into a dataframe and convert into factors
  names(pkg_df) <- c("Library", "n_packages") # Give new names
  pkg_df # return the package dataframe
}

# load using devtools::load_all() - as it loads to memory
  # OR USE SHORTCUT: Ctrl-Shift-L
# library takes from Installed to Memory
# devtools goes Source to Memory
