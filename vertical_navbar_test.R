library(shiny)
library(shinyWidgets)
library(gridExtra)
library(png)
library(grid)

ui <- fluidPage(
  titlePanel("Compare"),
  sidebarLayout(
    sidebarPanel(
      pickerInput(inputId = "countyInput", label = "Filter county",
                  choices = c("County1", "County2", "County3", "County4", "County5"),
                  options = list(`actions-box` = TRUE,size = 10, `selected-text-format` = "count > 9"),
                  multiple = TRUE),
      checkboxGroupInput(inputId = "reasonInput", label = "Filter reason",
                         choices = c("reason1", "reason2", "reason3"))
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    filename <- normalizePath(file.path("NicePhoto", paste0(input$countyInput, " ", input$reasonInput, ".png", sep = ""))) # you had one extra space before .png
    filename <- filename[file.exists(filename)]
    pngs = lapply(filename, readPNG)
    asGrobs = lapply(pngs, rasterGrob)
    p <- grid.arrange(grobs=asGrobs, nrow = 1)
  }, width = 1000)
}

shinyApp(ui = ui, server = server)