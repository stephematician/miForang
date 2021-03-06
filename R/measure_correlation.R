#' Measure correlation and stationary proportion between completed data sets
#'
#' Measures a relationship between two supplied completed data sets, typically
#' generated by two sequential iterations of the missForest procedure. 
#' Given by the rank correlation or proportion of stationary values for
#' ordered (including continuous) and categorical data respectively.
#' 
#' Measures a relationship between two supplied completed data sets, typically
#' generated by two sequential iterations of the missForest procedure. Intended
#' to be used with the stop criterion that as soon as all values (see below)
#' remain constant or decrease at once, then the missForest procedure is deemed
#' to have converged.
#'
#' The two values are the;
#' \itemize{
#'    \item mean rank correlation of the ordered (including continuous) data
#'          between the supplied completed data sets, and;
#'    \item proportion of stationary categorical data between the two supplied
#'          completed data sets (see \code{\link{stationary_rate}}).
#' }
#'
#' The type of correlation can be modified to that of \code{kendall} or
#' \code{pearson} (not recommended for ordered data) by the \code{method}
#' argument passed on to \code{\link[stats]{cor}}.
#'
#' @inheritParams perform_missforest
#' @param X named list;
#'            imputed values, in order of appearance by row in original data,
#'            of each variable (named) from one iteration within missForest
#'            procedure.
#' @param Y named list;
#'            imputed values, in order of appearance by row in origina data,
#'            of each variable (named) from the iteration within the missForest
#'            procedure succeeding that used to determine \code{X}.
#' @param method character;
#'            passed to \code{\link[stats]{cor}}.
#' @return named numeric;
#'             two named values: \describe{
#'                 \item{\code{continuous}}{mean (rank) correlation of the
#'                      continuous and ordered data between the two completed
#'                      data sets, and;}
#'                 \item{\code{categorical}}{proportion of stationary values of
#'                     categorical (unordered) data between the two completed
#'                     data sets (see \code{\link{stationary_rate}}).}
#'             }
#'
#' @seealso \code{\link[stats]{cor}} \code{\link{smirf}}
#'          \code{\link{stationary_rate}}
#'
#' @examples
#' \dontrun{
#' # simply pass to smirf 
#' smirf(iris, stop.measure=measure_correlation)
#' }
#' @export
measure_correlation <- function(X, Y, X_init, indicator, method='spearman') {

    ordered <- categorical <- NULL

    # ordered includes continuous - use !! to convert to logical
    ordered_data <- names(X)[!sapply(X, is.factor) | !!sapply(X, is.ordered)]

    categorical_data <- setdiff(names(X), ordered_data)

    if (length(ordered_data) > 0)
        ordered <- mean(mapply(function(x, y, d, indicator)
                               cor(xtfrm(c(x, d[!indicator])),
                                   xtfrm(c(y, d[!indicator])),
                                   method=method),
                               X[ordered_data],
                               Y[ordered_data],
                               X_init[ordered_data],
                               indicator[ordered_data]))

    if (length(categorical_data) > 0)
        categorical <- stationary_rate(X[categorical_data],
                                       Y[categorical_data],
                                       X_init[categorical_data],
                                       indicator[categorical_data])

    c(categorical=categorical, ordered=ordered)

}

