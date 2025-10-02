

# get the packeges needed
library(shiny)
library(Lab5)

ui <- fluidPage(
  titlePanel("Kolada Data Explorer"),

  sidebarLayout(
    sidebarPanel(
      textInput("kpi_title", "Search KPI by title:", "skola"),
      actionButton("go", "Search")
    ),

    mainPanel(
      tableOutput("kpi_results")
    )
  )
)

server <- function(input, output, session) {

  results <- eventReactive(input$go, {
    kpi(title = input$kpi_title, per_page = 10)$values
  })

  output$kpi_results <- renderTable({
    results()
  })
}

shinyApp(ui, server)
