% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/no_information_impute.R
\name{no_information_impute}
\alias{no_information_impute}
\title{Impute missing data using mean or mode of complete cases}
\usage{
no_information_impute(X, indicator = lapply(X, is.na))
}
\arguments{
\item{X}{data.frame;
a incomplete data set including any of numeric, logical, integer,
factor and ordered data types.}

\item{indicator}{named list;
indicator of missing (\code{=T}) and not-missing (\code{=F})
status for each column in \code{X}.}
}
\value{
data.frame; the same as \code{X} except for missing values in each
            column being replaced by either \itemize{
                \item the mean of the column if the column is non-integer 
                      numeric, or;
                \item a randomly selected most frequent value if the column
                      is a factor.
            }
}
\description{
Imputes missing data in a data.frame using either the complete cases' mean
or most frequent value for non-integer numeric and factor columns
respectively.
}
\details{
This is the same imputation procedure used to determine the initial state
of the missForest procedure (Stekhoven and Buehlmann, 2012). In the case of
tied most frequent values in a (factor) column, a single value is selected
at random from the tied values.
}
\examples{
\dontrun{
# simply pass to smirf
smirf(iris, X.init.fn=no_information_impute)
}
no_information_impute(data.frame(x=c(0,1,NA)))
}
\references{
Stekhoven, D.J. and Buehlmann, P., 2012. MissForest--non-parametric
missing value imputation for mixed-type data. \emph{Bioinformatics, 28}(1),
pp. 112-118.
\href{https://dx.doi.org/10.1093/bioinformatics/btr597}{doi.1.1093/bioinformatics/btr597}
}
\seealso{
\code{\link{smirf}} \code{\link[missForest]{missForest}}
}
