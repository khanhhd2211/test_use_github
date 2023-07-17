box::use(
  shiny[bootstrapPage, div, moduleServer, NS, renderUI, tags, uiOutput, renderPlot, plotOutput],
  ggplot2[ggplot, aes, geom_point],
  datasets[mtcars],
  dplyr
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  bootstrapPage(
    plotOutput(ns("testImg"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$testImg <-renderPlot({
      ggplot(mtcars) +
        aes(x = mpg, y = hp) +
        geom_point()
    })
  })
}
