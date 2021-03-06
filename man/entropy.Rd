% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/entropy.R
\name{entropy}
\alias{entropy}
\title{Calculate entropy of categorical data}
\usage{
entropy(x, freq = table(x))
}
\arguments{
\item{x}{ordered;
vector of categorical data.}

\item{freq}{numeric;
count of observations in each group.}
}
\value{
numeric;
            scalar value of entropy.
}
\description{
Calculate entropy of categorical data using tally of observations in each
category.
}
\details{
Calculates the entropy of categorical data using a tally of observations in
each category, using the following formula: \deqn{%
   H = - \frac{1}{\sum_j f_j} \sum_k f_k \log_2 \frac{f_k}{\sum_j f_j},%
}{
   H=- \sum [f_{k} log2 (f_{k} / \sum f_{j})] / sum f_{j},
}
where \eqn{f_k}{f_{k}} is the frequency in category indexed by \eqn{k}.
}
\keyword{internal}
