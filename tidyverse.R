library(dplyr) # Not how to do it in a package

# base R version
var_summary <- function(data, var) {
  data$min_var <- min(data[, substitute(var)])
  data$max_var <- max(data[, substitute(var)])
  data
}

# use {{embrace}} with two variables
var_summary <- function(data, var1, var2) {
  data |>
    summarise(
      min_var = min({{ var1 }}), # add a tunnel into the data.frame to find var
      max_var = max({{ var2 }})
      # called {{ embrace }}
    )
}

# enter outputs ...

# {{embrace}} with a single variable
var_summary <- function(data, var) {
  data |>
    summarise(
      min_var = min({{ var }}),
      max_var = max({{ var }})
    )
}

# using for a variable name
mtcars |>
  group_by(cyl) |>
  var_summary(mpg)


# use .data[[]] for string inputs
var_summary <- function(data, var1, var2) {
  data |>
    summarise(
      min_var = min(.data[[var1]]), # add a tunnel into the data.frame to find var
      max_var = max(.data[[var2]])
      # called {{ embrace }}
    )
}

mtcars |>
  group_by(cyl) |>
  var_summary("mpg", "disp")


#
big_cars_summary <- function(var) {
  mtcars |>
    filter(.data$cyl >= 6) |>
    group_by(.data$cyl) |>
    summarise(
      n = n(),
      mean = mean({{ var }})
    )
}

big_cars_summary(mpg)

# challenge
head(starwars)
# write a function that summarises one or more variables in starwars
# by any grouping variable

star_summary <- function(var1, var2) {
  starwars |>
    group_by(.data$hair_color) |>
    summarise(
      n = n_distinct({{var1}}),
      mean_h = mean({{var2}})
    )
}

star_summary(hair_color, mass)

# other answer from Andy
height_sum <- function(data, group_var) {
  data |>
    dplyr::group_by({{ group_var }}) |>
    dplyr::summarise(
      n = dplyr::n(),
      mean_height = mean(.data$height)
    )
}

height_sum(starwars, hair_color)

# Modify above answer such that function can take >1 grouping variables
height_sum <- function(data, ...) {
  data |>
    dplyr::group_by(...) |> # remove tunnel when using the ... to pass through
    dplyr::summarise(
      n = dplyr::n(),
      mean_height = mean(.data$height)
    )
}

height_sum(data = starwars, hair_color, sex)


# dynamic column naming with :=
var_summary <- function(data, var, var_name) {
  data |>
    summarise(
      "{var_name}" := min({{var}})
    )
}

var_summary(mtcars, cyl, "min_cyl")

# Challenge: write a function that sums starwars, and dynamically
  # creates new column names
# Answer:
dynamic_sum <- function(data, group_var, sum_var) {
  data |>
    dplyr::group_by({{ group_var }}) |>
    dplyr::summarise(
      n = dplyr::n(),
      "mean_{{sum_var}}" := mean({{ sum_var }})
    )
}
dynamic_sum(starwars, hair_color, mass)

# ... missing code from class
