\name{bigfiles}
\alias{bigfiles}
\title{Find large files in a directory}
\description{

}
\usage{
bigfiles(dir = "~/Downloads", pattern = character(), ...,
         files = list.files(dir, pattern = pattern, full = TRUE, ...),
         info = file.info(files)) 
}
\arguments{
  \item{dir}{the path to the directory interest}
  \item{pattern}{a regular expression used in \code{list.files} to
    filter the matching files by name}
  \item{\dots}{additional arguments passed to list.files}
  \item{files}{precomputed list of files. This allows the caller to
    discard or add files separately from a call to \code{list.files}.
  }
  \item{info}{precomputed data.frame/matrix of file information 
   assumed to be in the same order as the files in \code{files}.}
}
\value{
a data.frame with the information about the files in the specified directory.
}
\author{
  DTL
}

\seealso{
  \code{\link{list.files}},
  \code{\link{file.info}}
}
\examples{
bigfiles(pattern = "\\.tar\\.gz$")
}
\keyword{IO}

