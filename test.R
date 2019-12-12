# ADDING BOOTSTRAP TO MY WEBSITE ----

# LIBRARIES ----
library(shiny)
library(tidyverse)
library(plotly)
library(shinythemes) #https://rstudio.github.io/shinythemes/
library(shinyjs)

ui <- shiny::fluidPage(
  
  column(width = 8,
     div(
       class = "jumbotron",
       style = "background:url('MySelfButNiceJacket.jpg');background-size:cover", #add a background image to the jumbotron
       div(
         class = "container",
         style = "background-color:#76909c99", # change the background color and choose from inspect-elements
         h1("Hi, I am Pierrick!"),
         p("It's your solution for building web applications with", code("R")),
         p(class = "btn btn-lg btn-primary","Learn More", href = "#")
       )
     )  
  ),
  column(
    width = 4,
    div(
      class = "container",
      img(
        class = "img-circle img-responsive", # thumbnail formats the image with a border with rounded corners
        src = "MySelfButNiceJacket.jpg", # no need to add www/, shiny knows it
        style = "width:200px;" #set a maximum size to the responsive component of the image
      ) %>% a(href = "https://en.wikipedia.org/wiki/Giant_panda", target = "_blank") # to add hyperling to the image
      
    )
  ),
  
  div(
    class = "container",
    br(),
    column(
      width = 8,
      
      # 7.1 Thumbnail ----
      # Allows to create framed image
      div(
        class = "jumbotron",
        style = "background:url('MySelfButNiceJacket.jpg');background-size:cover", #add a background image to the jumbotron
        div(
          class = "container",
          style = "background-color:#76909c99", # change the background color and choose from inspect-elements
          h1("Hi, I am Pierrick!"),
          p("It's your solution for building web applications with", code("R")),
          p(class = "btn btn-lg btn-primary","Learn More", href = "#")
        )
      )  
    ),
    column(
      width = 4,
      
      # 7.3 Image Circle ----
      img(
        class = "img-circle img-responsive", # thumbnail formats the image with a border with rounded corners
        src = "MySelfButNiceJacket.jpg", # no need to add www/, shiny knows it
        style = "width:200px;" #set a maximum size to the responsive component of the image
      ) %>% a(href = "https://en.wikipedia.org/wiki/Giant_panda", target = "_blank") # to add hyperling to the image
    ),
  ),
  
  
  
  
  
  
  
)

server <- function(input, output, session){}

shinyApp(ui = ui, server = server)

