% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/highcharter-helper.R
\name{hc_freq_by_year_ci}
\alias{hc_freq_by_year_ci}
\title{Experimental: Plot interactive frequency by year graphs with confidence intervals using highcharter}
\usage{
hc_freq_by_year_ci(
  df,
  as.alternatives = FALSE,
  ylabel = if (as.alternatives) "\%" else "ipm",
  smooth = FALSE,
  ...
)
}
\arguments{
\item{df}{data frame like the value of a \code{\link{frequencyQuery}}}

\item{as.alternatives}{boolean decides whether queries should be treated as mutually exclusive and exhaustive wrt. to some meaningful class (e.g. spelling variants of a certain word form).}

\item{ylabel}{defaults to \% if \code{as.alternatives} is \code{true} and to "ipm" otherwise.}

\item{smooth}{boolean decides whether the graph is smoothed using the highcharts plot types spline and areasplinerange.}

\item{...}{additional arguments passed to \code{\link{hc_add_series}}}
}
\description{
Experimental convenience function for plotting typical frequency by year graphs with confidence intervals using highcharter.
\bold{Warning:} This function may be moved to a new package.
}
\examples{
\donttest{year <- c(1990:2018)}\dontshow{year <- c(2013:2013)}
\donttest{alternatives <- c("macht []{0,3} Sinn", "ergibt []{0,3} Sinn")}\dontshow{alternatives <- c("macht []{0,3} Sinn")}
new("KorAPConnection", verbose = TRUE) \%>\%
  frequencyQuery(query = alternatives,
                 vc = paste("textType = /Zeit.*/ & pubDate in", year),
                 as.alternatives = TRUE) \%>\%
  hc_freq_by_year_ci(as.alternatives = TRUE)

\donttest{
kco <- new("KorAPConnection", verbose = TRUE)
expand_grid(
  condition = c("textDomain = /Wirtschaft.*/", "textDomain != /Wirtschaft.*/"),
  year = (2005:2011)
) \%>\%
  cbind(frequencyQuery(
    kco,
    "[tt/l=Heuschrecke]",
    paste0(.$condition, " & pubDate in ", .$year)
  ))  \%>\%
  hc_freq_by_year_ci()
}

}
