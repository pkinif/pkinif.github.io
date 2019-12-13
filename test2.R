# LIBRARIES ----
library(shiny)
library(tidyverse)
library(lubridate)
library(plotly)
library(shinythemes) #https://rstudio.github.io/shinythemes/
library(shinyjs)
library(textreadr)
library(eeptools)

source("footer.R")

age <- age_calc(dob = ymd("1994-11-21"), enddate = today(), units = "years") %>% round()

# UI ----
ui <- shiny::fluidPage(
  themeSelector(),
  shinyjs::useShinyjs(),

  # 1.0 NAVBARPAGE ----
  navbarPage(
    title = "Pierrick KINIF",
    inverse = FALSE,
    collapsible = TRUE,
    selected = 2,
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
      br(),
      title = strong("About Me"),
      value = 1,
      icon = icon("hand-point-right"),
      br(),
      hr(),
      
      # 2.1 MAIN CONTENT ----
      div(
        class = "container well",
        style = "background-color: #ddd;",
        column(
          width = 4,
          div(
            class = "thumbnail text-center", # any object in this div will have this format
            style = "padding: 12px",
            img(class = "img-circle img-responsive", src = "MySelfButNiceJacket.jpg"),
            br(),
            h3(strong("Data Scientist @"), a(href="https://www.decathlon.be/fr/", target = "_blank","Decathlon Belgium")), 
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
              "MBA graduate, Ex-Credit Risk Data Analyst, Ex-Assistant Sustainability Practice, Ex-Department Manager, I am currently working as a", 
              code("Data Scientist"), 
              "at Decathlon Belgium.",
              br(),
              br(),
              "I have found that nothing satisfies me more than evolving in a dynamic, intellectual, 
              and challenging environment that places people and planet at the heart of all of its decision-making."            
            ),
            h3(
              style = "color: #7dbc9c;",
              "As a Data Scientist, my first motivation is to make data available to the many in building fun and readable", em("Web Applications."),
              "Then, I also like to optimize processes and efficiency using", em("Machine Learning & Automatization.")
            )
          )
        )
      )
    ),
    
    # 3.0 CV ----
    tabPanel(
      title = strong("Curriculum Vitae"),
      value = 2,
      icon = icon("file"),

      div(
        class = "jumbottron",
        style = "
          background-image:url('mountain.jpeg');
          background-size:cover; 
          height: 100%;
          min-height: 350px;
          width: 100%; 
          background-repeat: no-repeat;
          background-position: center; 
          margin-bottom: 40px        "
        , 
        div(
          class = "container-fluid",
          style = "color:#122546;",
          div(
            class = "text-center",
            h1(strong("Pierrick Kinif")),
            h2(strong("Data Scientist | Self-learner | Trekking & Nature Lover ")),
            hr(),
            br(),
            div(
              class = "text-left",
              style = "color:#f8f9fa;",
              column(
                width = 3,
                h3(code("LOCATION")),
                h3(code("DEGREE")),
                h3(code("E-MAIL"))
              ),
              column(
                width = 3,
                h3("Belgium"),
                h3("MBA"),
                h3("pierrick-kinif@hotmail.be")
              ),
              column(
                width = 3,
                h3(code("PHONE")),
                h3(code("AGE")),
                h3(code("FOLLOW ME"))
              ),
              column(
                width = 3,
                h3("+32 478 113 485"),
                h3(str_glue("{age} years")),
                HTML("	
                <ul class='list-inline'>
              		<li>
              		  <a href='https://www.linkedin.com/in/pierrickkinif/' target='_blank' class='btn btn-info'>
              			<i class='fab fa-linkedin'></i>
              		  </a>
              		</li>
              		<li>
              		  <a href='https://github.com/pkinif' target='_blank' class='btn btn-success'>
              			<i class='fab fa-github'></i>
              		  </a>
              		</li>
              		<li>
              		  <a href='https://www.facebook.com/pierrickk' target='_blank' class='btn btn-primary'>
              			<i class='fab fa-facebook'></i>
              		  </a>
              		</li>
                </ul>
                "
                )
              )              
            )
          )
        )
      ),
      fluidRow(
        div(
          class = "container-fluid",
          column(
            width = 10, 
            offset = 1,
            style = "
            margin-left: 0%; width: 100%
            ",
            verticalTabsetPanel(
              verticalTabPanel(
                title = "Education", icon = icon("university", "fa-2x"),
                div("Content panel 3")
              ),
              verticalTabPanel(
                title = "Experiences", icon = icon("rocket", "fa-2x"),
                "Content panel 2"
              ),
              verticalTabPanel(
                title = "Languages", icon = icon("comments", "fa-2x"),
                "Content panel 2"
              ),
              verticalTabPanel(
                title = "Certifications", icon = icon("award", "fa-2x"),
                "Content panel 3"
              )          
            )
          )
        )    
      )
    ),
    
    # 3.0 PORTFOLIO ----
    tabPanel(
      title = strong("Portfolio"),
      value = 3,
      icon = icon("wallet")
    ),
    
    # 4.0 CONTACT ICON ----
    navbarMenu(
      title = strong("Contact Me"),
      icon = icon("feather-alt"),
      tabPanel(
        tags$a(
          HTML("<p> <i class='fab fa-linkedin'></i> &thinsp;Linkedin </p>"),
          href="https://www.linkedin.com/in/pierrickkinif/", 
          target = "_blank"
        )
      ),
      tabPanel(
        tags$a(
          HTML("<p> <i class='fab fa-github'></i> &thinsp;GitHub </p>"),
          href="https://github.com/pkinif", 
          target = "_blank"
        )
      ),
      tabPanel(
        tags$a(
          HTML("<p> <i class='fas fa-envelope'></i> &thinsp;Email </p>"),
          href="mailto:pierrick-kinif@hotmail.be", 
          target = "_blank"
        )
      ),
      tabPanel(
        tags$a(
          HTML("<p> <i class='fab fa-facebook'></i> &thinsp;Facebook </p>"),
          href="https://www.facebook.com/pierrickk", 
          target = "_blank"
        )
      )
    ),

    # 5.0 CODE WEBSITE   -----
    tabPanel(
      # class= "nav-link active",
      title = strong("Code"),
      id = "code",
      href = "https://github.com/pkinif/pkinif.github.io",
      icon = icon("code")
    )
    # ,
    # tabPanel(
    #   tags$a(
    #     HTML("<p> <i class='fas fa-code'></i> &thinsp;Code </p>"),
    #     href="https://github.com/pkinif/pkinif.github.io", 
    #     target = "_blank"
    #   )
    # ),
    # tabPanel(title=tags$a(HTML("<i class='fas fa-code'></i>")), href = "#", target = "_blank"),
    # tabPanel(
    #       HTML("<a href='https://github.com/pkinif/pkinif.github.io' target='_blank'><i class=' fa fa-code fa-fw'></i>&thinsp;<strong>Code</strong></a>")
    #       )    
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

