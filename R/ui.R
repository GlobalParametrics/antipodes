#' antipodes UI
#'
#' Simple Shiny app UI
#'
#' @export
ui <- function() {
  fluidPage(
    theme = "style.css",
    tags$link(
      href = "NationalPark-Regular.ttf",
      rel = "stylesheet"
    ),
    uiOutput("message"),
    leafletOutput("map"),
    tags$a(
      class = "nationalpark-attribution",
      href = "https://nationalparktypeface.com",
      "Uses the National Park Typeface!"
    ),
    tags$a(
      class = "nationalpark-attribution",
      href = "https://nationalparktypeface.com/License",
      "(License)"
    )
  )
}