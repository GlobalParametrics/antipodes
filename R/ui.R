#' antipodes UI
#'
#' Simple Shiny app UI
#'
#' @export
ui <- function() {
  fluidPage(
    theme = "style.css",
    leafletOutput("map")
  )
}