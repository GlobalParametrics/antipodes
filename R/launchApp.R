#' launchApp
#'
#' Launches the shiny application for this package.
#'
#' @export
launchApp <- function() {
  runApp(system.file("antipodes", package = "antipodes"),
         launch.browser = FALSE, port = 3838, host = "0.0.0.0")
}