library(shiny)
library(detourr)
library(crosstalk)
data("iris")

server <- function(input, output) {
  shared_detour <- crosstalk::SharedData$new(iris)
  output$detour1   <- detourr::shinyRenderDisplayScatter2d(detourr::detour(shared_detour, 
                                                                                detourr::tour_aes(projection = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),colour = Species)) |>
                                                                  detourr::tour_path(detourr::grand_tour(2), fps = 60, 
                                                                                     max_bases=20) |>
                                                                  detourr::show_scatter(alpha = 0.7, 
                                                                                        axes = TRUE, scale_factor = 0.4), quoted = FALSE)
  output$detour2 <- detourr::shinyRenderDisplayScatter2d(detourr::detour(shared_detour, 
                                                                                detourr::tour_aes(projection = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),colour = Species)) |>
                                                                  detourr::tour_path(detourr::grand_tour(2), fps = 60, 
                                                                                     max_bases=20) |>
                                                                  detourr::show_scatter(alpha = 0.7, 
                                                                                        axes = TRUE, scale_factor = 0.4), quoted = FALSE)
  
  }


ui <- fluidPage(
  shiny::fluidRow(shiny::column(6,
                                detourr::displayScatter2dOutput("detour1",width = "100%", height = "400px")),          
                  shiny::column(6,
                                detourr::displayScatter2dOutput("detour2",width = "100%", height = "400px")))
  )


shinyApp(ui = ui, server = server)
