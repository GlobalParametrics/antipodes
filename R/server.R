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
  output$message <- renderUI({
    tags$div(
      class = "message",
      "Click on a point to see where the opposite side of the earth is"
    )
  })

  output$map <- renderLeaflet({
    leaflet(height = "90%", width = "90%") %>%
      addProviderTiles(
        "Stamen.Toner",
        options = providerTileOptions(noWrap = TRUE)
      ) %>% flyTo(lng = 0, lat = 0, zoom = 2)
  })

  observeEvent(input$map_click, {
    output$message <- NULL

    anti_lat <- -input$map_click$lat
    anti_lng <- (abs(input$map_click$lng) - 180) *
      (input$map_click$lng / abs(input$map_click$lng))

    cat(paste("lat:", input$map_click$lat, "lng:", input$map_click$lng), "\n")
    cat(paste("anti_lat:", anti_lat, "anti_lng:", anti_lng), "\n")

    leafletProxy("map") %>%
      clearMarkers() %>%
      flyTo(lng = anti_lng, lat = anti_lat, zoom = 2) %>%
      addMarkers(lng = anti_lng, lat = anti_lat)
  })
}