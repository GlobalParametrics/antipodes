#' antipodes Server
#'
#' Simple server function for Shiny app
#'
#' @param session Shiny session object
#' @param input Shiny input object
#' @param output Shiny output object
#'
#' @export
server <- function(session, input, output) {
  output$map <- renderLeaflet({
    leaflet(height = "90%", width = "90%") %>%
      addProviderTiles(
        "Stamen.Toner",
        options = providerTileOptions(noWrap = TRUE)
      ) %>% flyTo(lng = 0, lat = 0, zoom = 1)
  })

  observeEvent(input$map_click, {
    leafletProxy("map") %>%
      clearMarkers() %>%
      flyTo(lng = -input$map_click$lng, lat = -input$map_click$lat,
            zoom = 2) %>%
      addMarkers(lng = -input$map_click$lng, lat = -input$map_click$lat)
  })
}