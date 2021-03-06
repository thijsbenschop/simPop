% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addKnownMargins.R
\name{addKnownMargins}
\alias{addKnownMargins}
\title{add known margins/totals}
\usage{
addKnownMargins(inp, margins)
}
\arguments{
\item{inp}{a \code{simPopObj} containing population and household survey
data as well as optionally margins in standardized format.}

\item{margins}{a \code{data.frame} containing for a combination of unique
variable levels for n-variables the number of known occurences in the
population. The numbers must be listed in the last column of data.frame
'margins' while the characteristics must be listed in the first 'n' columns.}
}
\value{
an object of class \code{\linkS4class{simPopObj}} with updated slot
'table'.
}
\description{
add known margins/totals for a combination of variables for the population
to an object of class \code{\linkS4class{simPopObj}}.
}
\details{
The function takes a data.frame containing known marginals/totals for a some
variables that must exist in the population (stored in slot 'pop' of input
object 'inp') and updates slot 'table' of the input object. This slot
finally contains the known totals.

households are drawn from the data and new ID's are generated for the new
households.
}
\examples{
data(eusilcS)
data(eusilcP)
\dontrun{
## approx. 20 seconds computation time
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
inp <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))
inp <- simCategorical(inp, additional=c("pl030", "pb220a"), method="multinom",nr_cpus=1)

margins <- as.data.frame(
  xtabs(rep(1, nrow(eusilcP)) ~ eusilcP$region + eusilcP$gender + eusilcP$citizenship))
colnames(margins) <- c("db040", "rb090", "pb220a", "freq")
inp <- addKnownMargins(inp, margins)
str(inp)
}
}
\references{
M. Templ, B. Meindl, A. Kowarik, A. Alfons, O. Dupriez (2017) Simulation of Synthetic Populations for Survey Data Considering Auxiliary
Information. \emph{Journal of Statistical Survey}, \strong{79} (10), 1--38. \doi{10.18637/jss.v079.i10}
}
\author{
Bernhard Meindl
}
\keyword{manip}
