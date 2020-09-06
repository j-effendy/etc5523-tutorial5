library(shiny)

ui <- fluidPage(
  actionButton("flip", "Flip coin 100 times"),
  htmlOutput("estimate")
)

server <- function(input, output, session) {
  
  out <- reactive({
    sample(c("H", "T"), size = 100,
           replace = TRUE, prob = c(0.8, 0.2))
  })
  
  output$estimate <- renderUI({
    if(input$flip) {
      span(strong("Estimate of the probability of getting a head:"),
           round(mean(out()=="H"), 3))
    }
  })
}

shinyApp(ui, server)