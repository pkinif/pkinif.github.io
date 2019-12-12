# LIBRARIES ----
library(shiny)
library(tidyverse)
library(plotly)
library(shinythemes) #https://rstudio.github.io/shinythemes/
library(shinyjs)
library(textreadr)

source("footer.R")

# UI ----
ui <- shiny::fluidPage(
  themeSelector(),
  shinyjs::useShinyjs(),

  # 1.0 NAVBARPAGE ----
  navbarPage(
    title = "Pierrick KINIF",
    # class = "navbar navbar-default navbar-fixed-top",
    inverse = FALSE,
    collapsible = TRUE,
    position = "fixed-top",
    footer = tags$footer(HTML(str_glue("{footer}"))),
    theme = shinytheme("superhero"),
    header = div(
      class = "pull-right",
      style = "padding-right: 20px;",
      p("Welcome!")
    ), 
    
    # 2.0 ABOUT ME ----
    tabPanel(
      title = strong("About Me"),
      id = "AboutMe",
      icon = icon("hand-point-right"),
      br(),
      hr(),
      
      # 3.0 MAIN CONTENT ----
      div(
        class = "container well",
        style = "background-color: #ddd;",
        column(
          width = 4,
          div(
            class = "thumbnail text-center", # any object in this div will have this format
            style = "padding: 12px",
            img(class = "img-rounded img-responsive", src = "MySelfButNiceJacket.jpg"),
            br(),
            h3(strong("Data Scientist @"), a(href="#", target = "_blank","Decathlon Belgium")), 
            br(),
            h4(strong(em(p("Want to know more?")))),
            br(),
            a(
              class = "btn btn-success btn-lg", 
              href = "https://www.pierrickkinif.com/Cv.html", 
              target = "_blank", "Check my CV"
            )
          )
        ),    
        column(
          width = 8,
          fluidRow(
            h1(
              class = "text-left text-warning",
              style = "padding-bottom: 0px !important;",  
              p("Hello, I am", code("Pierrick!"))
            ),
            br(),
            tags$blockquote(
              class = "blockquote-reverse",
              style = "color: #7ab98d;",
              h2(em(strong("A Self Learner Data Science Enthusiast keeping himself up-to-date on new technologies.")))
            ),
            h3(
              style = "color: #7dbc9c;",
              "MBA graduate, Ex-Credit Risk Data Analyst, Ex-Assistant Sustainability Practice, I am currently working as a Department Manager at Decathlon. 
              I have found that nothing satisfies me more than evolving in a dynamic, intellectual, 
              and challenging environment which places people and planet at the heart of all of its decision-making."
            ),
            h3(
              style = "color: #7dbc9c;",
              "I am a goal-oriented person and my passion for data science (R user [2+ years]) helps me to develop excellent decision-making tools 
              and techniques."
            )
          )
        )
      )
    ),
    
    # 4.0 CV ----
    tabPanel(
      title = strong("Curriculum Vitae"),
      id = "cv",
      icon = icon("file"),
      br(),
      hr()
    ),
    
    # 5.0 CONTACT ICON ----
    navbarMenu(
      title = strong("Contact Information"),
      icon = icon("pen-fancy"),
      tabPanel(
        title = "Linkedin",
        icon = icon("linkedin")
      ),
      tabPanel(
        title = "GitHub",
        icon = icon("github")
      ),
      tabPanel(
        title = "Email",
        icon = icon("envelope")
      ),
      tabPanel(
        a(
          href="http://google.com", 
          target="_blank"
        ),
        title = "Facebook",
        icon = icon("facebook")
        
        # uiOutput("Link_Facebook")
      )  ,
      tabPanel(tags$a("Open Sales Gsheet", href="http://google.com", target="_blank", icon = icon("facebook")))      
    )    
  )
)

# SERVER ----

server <- function(input, output, session){
  
  # output$Link_Facebook <- renderUI({
  #   
  #   # a("test", href="http://google.com", target="_blank")
  #   
  # })
}



shinyApp(ui = ui, server = server)

