#' Disaggregated Data from the UCDP
#'
#' This package contains the most disaggregated data available
#' from the Uppsala Conflict Data Program, i.e. the Georeferenced
#' Event Dataset (GED) Global version 20.1.
#'
#' @docType package
#' @name ucdp
#' @aliases ucdp ucdp-package
NULL

#' UCDP Georeferenced Event Dataset (GED) Global version 20.1
#'
#' This dataset is UCDP's most disaggregated dataset, covering
#' individual events of organized violence (phenomena of lethal
#' violence occurring at a given time and place). These events
#' are sufficiently fine-grained to be geo-coded down to the
#' level of individual villages, with temporal durations
#' disaggregated to single, individual days.
#'
#' @source \url{https://ucdp.uu.se/downloads/index.html#ged_global}
#' @source Pettersson, Therese & Magnus Öberg (2020)
#'         Organized violence, 1989-2019.
#'         Journal of Peace Research 57(4)
#' @source Sundberg, Ralph and Erik Melander (2013)
#'         Introducing the UCDP Georeferenced Event Dataset.
#'         Journal of Peace Research 50(4).
#'
#' @format A 225,385 x 38 tibble.
#'
#' @section Variables:
#' \describe{
#'   \item{id}{A unique numeric ID identifying each event}
#'   \item{year}{The year of the event}
#'   \item{active_year}{1 if the conflict is active, 0 if not}
#'   \item{type_of_violence}{Conflict type: 1 if state-based conflict,
#'                           2 if non-state conflict, 3 if one-sided violence}
#'   \item{conflict_new_id}{A unique conflict identification code for each individual conflict}
#'   \item{conflict_name}{Name of the conflict}
#'   \item{dyad_new_id}{A unique conflict identification code for each individual dyad}
#'   \item{dyad_name}{Name of the conflict dyad creating the event}
#'   \item{side_a_new_id}{A unique ID of side A of the conflict}
#'   \item{side_a}{The name of side A in the dyad}
#'   \item{side_b_new_id}{A unique ID of side B of the conflict}
#'   \item{side_b}{The name of side B in the dyad}
#'   \item{number_of_sources}{Number of total sources containing information
#'                            for an event that were consulted}
#'   \item{source_article}{References to the names, dates, and titles of the sources}
#'   \item{source_office}{The name of the organizations publishing the source materials}
#'   \item{source_date}{The dates the source materials were published on}
#'   \item{source_headline}{The titles of the source materials}
#'   \item{source_original}{The name or type of person or organization whence the source originates}
#'   \item{where_prec}{The precision with which the coordinates are measured}
#'   \item{where_coordinates}{Location}
#'   \item{where_description}{Comments on the location}
#'   \item{adm_1}{Name of the first order administrative division where the event took place}
#'   \item{adm_2}{Name of the second order administrative division where the event took place}
#'   \item{latitude}{Latitude (in decimal degrees)}
#'   \item{longitude}{Longitude (in decimal degrees)}
#'   \item{country}{Name of the country in which the event took place}
#'   \item{region}{Region where the event took place (one of: Africa, Americas,
#'                 Asia, Europe, Middle East)}
#'   \item{event_clarity}{1 for events where the reporting is clear enough to allow
#'                        full identification, 2 otherwise}
#'   \item{date_prec}{How precise the information is about the date of an event}
#'   \item{date_start}{The earliest possible date when the event has taken place}
#'   \item{date_end}{The last possible date when the event has taken place}
#'   \item{deaths_a}{The best estimate of deaths sustained by side A}
#'   \item{deaths_b}{The best estimate of deaths sustained by side B}
#'   \item{deaths_civilians}{The best estimate of dead civilians in the event}
#'   \item{deaths_unknown}{The best estimate of deaths of persons of unknown status}
#'   \item{best}{The best (most likely) estimate of total fatalities resulting from an event}
#'   \item{high}{The highest reliable estimate of total fatalities}
#'   \item{low}{The lowest reliable estimate of total fatalities}
#' }
#'
#' @docType data
#' @name GED
#' @usage GED
#' @keywords datasets
"GED"
