% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/leiks_D.R
\name{leiks_D}
\alias{leiks_D}
\title{Calculate Leik's D of ordered data}
\usage{
leiks_D(x)
}
\arguments{
\item{x}{ordered;
ordered data or data that can be coerced into ordered via
\code{\link{as.factor}} and \code{\link{factor}} with 
\code{ordered=T}.}
}
\value{
numeric;
            scalar value of Leik's D
}
\description{
Calculate Leiks' D of ordered data
}
\details{
Calculates the dispersion via the Leik's D statistic for ordinal data using
the following formula; \deqn{
   D = \frac{2}{n - 1} \left(%
           \sum_{k : F_k < 0.5} F_k + \sum_{k : F_k \geq 0.5} 1 - F_k%
       \right),%
}{
   D = 2 \sum (F_{k} if F_{k} < 0.5 or 1 - F_{k} if F_{k} > 0.5) / (n - 1)
}
where \eqn{n} is the number of categories, and \eqn{F_k}{F_{k}} is the
cumulative distribution for category indexed by \eqn{k}, except in the case
of one category, where the value 0 is returned.
}
\keyword{internal}
