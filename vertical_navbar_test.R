library(shinyWidgets)

if (interactive()) {
  
  library(shiny)
  library(shinyWidgets)
  
  ui <- fluidPage(
    fluidRow(
      column(
        width = 10, offset = 1,
        tags$h2("Vertical tab panel example"),
        verticalTabsetPanel(
          verticalTabPanel(
            title = "Title 1", icon = icon("home", "fa-2x"),
            "Content panel 1"
          ),
          verticalTabPanel(
            title = "Title 2", icon = icon("map", "fa-2x"),
            "Content panel 2"
          ),
          verticalTabPanel(
            title = "Title 3", icon = icon("rocket", "fa-2x"),
            "Content panel 3"
          )
        )
      )
    )
  )
  
  server <- function(input, output, session) {
    
  }
  
  shinyApp(ui, server)
  
}
