% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_existing_property.R
\name{check_existing_property}
\alias{check_existing_property}
\title{Check if a label already has a property.}
\usage{
check_existing_property(
  search_term,
  language,
  equivalence_property = NA_character_,
  equivalence_id = NA_character_,
  classification_property = NA_character_,
  classification_id = NA_character_,
  action = "create_property",
  log_file_name = NA_character_,
  data_curator = person("Unknown", "Person"),
  wikibase_api_url = "https://www.wikidata.org/w/api.php",
  ambiguity_handling = "return_first",
  csrf = NULL
)
}
\arguments{
\item{search_term}{A character string specifying the label to search for. For
example, "instance of".}

\item{language}{A character string specifying the language code of the label,
adhering to BCP 47 standards (e.g., \code{"en"} for English). Defaults to
\code{"en"}.}

\item{wikibase_api_url}{The full URL of the Wikibase API. Defaults to
\code{'https://www.wikidata.org/w/api.php'}, which is Wikidata's API endpoint.}

\item{ambiguity_handling}{A character string specifying how to handle cases
where multiple properties match the search term. Options are
\code{"return_first"} (default) to return the first match, or
\code{"return_null"} to return \code{NULL} when multiple matches are found.}

\item{csrf}{The CSRF token of your session, obtained with
\code{\link{get_csrf}}. Not needed if
\code{wikibase_api_url="https://www.wikidata.org/w/api.php"}. Defaults to
\code{NULL}.}
}
\value{
A data frame containing details of the matching property, or
\code{NULL} if no match is found or if multiple matches are found and
\code{ambiguity_handling} is set to \code{"return_null"}.
}
\description{
Avoid failed writing attempts by checking if a label already
matches a property.
}
\details{
A wrapper around
\href{https://www.wikidata.org/w/api.php?action=help&modules=wbsearchentities}{MediaWiki
action=wbsearchentities}.
}
\examples{
# No CSRF needed for Wikidata
check_existing_property(
  search_term = "instance of",
  language = "en",
  wikibase_api_url = "https://www.wikidata.org/w/api.php"
)
}
