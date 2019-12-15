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

# VARIABLES ----

age <- age_calc(dob = ymd("1994-11-21"), enddate = today(), units = "years") %>% round()
r_experience_years <- age_calc(dob = ymd("2017-09-01"), enddate = today(), units = "years") %>% round()

# UI ----
ui <- shiny::fluidPage(
  # themeSelector(),
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
    
    # 3.1 General Information ----
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
            br(),
            h1(strong("Pierrick Kinif")),
            h2(strong("Data Scientist | Self-learner | Trekking & Nature Lover ")),
            hr(),
            br(),
            div(
              class = "text-left",
              style = "color:#f8f9fa;",
              fluidRow(
                style = "padding-left: 8%;",
                h3(class = "text-left", code("LOCATION")) %>% column(width = 3),
                h3(class = "text-left", strong("Belgium")) %>% column(width = 3),
                h3(class = "text-left", code("PHONE")) %>% column(width = 3),
                h3(class = "text-left", strong("+32 478 113 485")) %>% column(width = 3)
              ),
              fluidRow(
                style = "padding-left: 8%;",
                h3(class = "text-left", code("DEGREE")) %>% column(width = 3),
                h3(class = "text-left", strong("MBA")) %>% column(width = 3),
                h3(class = "text-left", code("AGE")) %>% column(width = 3),
                h3(class = "text-left", strong(str_glue("{age} years"))) %>% column(width = 3)
              ),  
              fluidRow(
                style = "padding-left: 8%;",
                h3(class = "text-left", code("EMAIL")) %>% column(width = 3),
                h3(class = "text-left", strong("pierrick-kinif@hotmail.be")) %>% column(width = 3),
                h3(class = "text-left", code("FOLLOW ME")) %>% column(width = 3),
                h3(class = "text-left", HTML("	
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
                )) %>% column(width = 3)
              )   
            )
          )
        )
      ),
      
      # 3.2 Main Information ----
      fluidRow(
        div(
          class = "container-fluid",
          column(
            width = 10, 
            offset = 1,
            style = "margin-left: 0%; width: 100%",
            
            verticalTabsetPanel(
              # 3.2.1 Experiences ----
              verticalTabPanel(
                title = "EXPERIENCE", 
                icon = icon("rocket", "fa-2x"),
                
                # D4 - Data Scientist ----
                fluidRow(
                  style = "color: #2b3e50;",
                  h3(strong("DATA SCIENTIST")) %>% column(width = 8),
                  h3(class = "text-right", "June 2019 - Present") %>% column(width = 4)
                ),
                h4(style = "color: #4d5c6b;", a(href = "https://www.decathlon.be/fr/", target = "_blank",strong(em("Decathlon Belgium")))),
                tags$ul(
                  style = "color: #4d5c6b;",
                  tags$li("Item 1"),
                  tags$li("Item 2"),
                  tags$li("Item 3"),
                  tags$li("Item 4")
                ),                
                hr(),
                
                # D4 - Ski & Hiking Department Manager ----
                fluidRow(
                  style = "color: #2b3e50;",
                  h3(strong("SKI & HIKING DEPARTMENT MANAGER")) %>% column(width = 8),
                  h3(class = "text-right", "Sept. 2018 - June 2019") %>% column(width = 4)
                ),
                h4(style = "color: #4d5c6b;", a(href = "https://www.decathlon.be/fr/", target = "_blank",strong(em("Decathlon Belgium")))),
                tags$ul(
                  style = "color: #4d5c6b;",
                  tags$li("Leading a team of 15 individuals who are fanatically devoted to sharing their sports passion to customers;"),
                  tags$li("Strategies implementation to increase sales growth (+ 8%) and customer satisfaction;"),
                  tags$li("Support, challenge and build both commercial and human skills of the team;"),
                  tags$li("Inventory management and optimization.")
                ),                
                hr(),
                
              
              # IMS  ----
              fluidRow(
                style = "color: #2b3e50;",
                h3(strong("ASSISTANT SUSTAINABILITY PRACTICE")) %>% column(width = 8),
                h3(class = "text-right", "Sept. 2017 - March 2018") %>% column(width = 4)
              ),
              h4(style = "color: #4d5c6b;", a(href = "https://imslux.lu/eng", target = "_blank",strong(em("IMS Luxembourg")))),
              tags$ul(
                style = "color: #4d5c6b;",
                tags$li("Analysis of a Corporate Social Responsibility survey presented during the", a(href = "https://www.youtube.com/watch?v=GIjwK_j_HyY", target = "_blank","Luxembourg Sustainability Forum (ie. LSF) 2017."), "See the", a(href = "Files/CSR_SURVEY_IMS_2018.pdf", target = "_blank","publication;")),
                tags$li("Help for the organization of the LSF 2017 & media follow-up;"),
                tags$li("Organization of a workshop as part of the food pillar of the Luxembourg Strategy for",a(href = "Files/TIR-Strategy-Study_Short.pdf" , target = "_blank","the Third Industrial Revolution;")),
                tags$li("Measurement of the company’s carbon footprint;"),
                tags$li("Research and writing assistance for the publication of the", em("'Sustainability Magazine - 5th edition'."))
              ),                
              hr(),     
              
              # BIL  ----
              fluidRow(
                style = "color: #2b3e50;",
                h3(strong("CREDIT RISK DATA ANALYST INTERN")) %>% column(width = 8),
                h3(class = "text-right", "January 2017 - June 2017") %>% column(width = 4)
              ),
              h4(style = "color: #4d5c6b;", a(href = "https://www.bil.com/fr/entreprises/Pages/index.aspx", target = "_blank",strong(em("Bank International of Luxembourg")))),
              tags$ul(
                style = "color: #4d5c6b;",
                tags$li(code("Using SQL"), "- Validating and ensuring consistency of the credit risk databases;"),
                tags$li(code("Using VBA"), "- Development of an application to automatize the data validation process;"),
                tags$li("Review risk exposure calculations and forecasts for Basel Requirements.")
              ),                
              hr(), 
              
              # 4UCAMPUS  ----
              fluidRow(
                style = "color: #2b3e50;",
                h3(strong("CAMPUS CONSULTANT")) %>% column(width = 8),
                h3(class = "text-right", "Sept. 2015 - March 2016") %>% column(width = 4)
              ),
              h4(style = "color: #4d5c6b;", a(href = "https://www.4ucampus.be/fr/", target = "_blank",strong(em("4UCAMPUS")))),
              tags$ul(
                style = "color: #4d5c6b;",
                tags$li("Sales of subscriptions of press titles to students and academic staff;"),
                tags$li("Promote the company’s products and expand the client base.")
              ),                
              hr(), 
              
              ),
            
              # 3.2.2 Education ----
              verticalTabPanel(
                title = "EDUCATION", 
                icon = icon("university", "fa-2x"),
                
                # UNI ----
                fluidRow(
                  style = "color: #2b3e50;",
                  h3(strong("UNIVERSITY OF LUXEMBOURG")) %>% column(width = 8),
                  h3(class = "text-right", "September 2017 - Present") %>% column(width = 4)
                ),
                h4(style = "color: #4d5c6b;", strong(em("Certificate in Sustainable Development and Social Innovation"))),
                p(
                  style = "color: #4d5c6b;",
                  "Participated in the first national initiative to gather all Luxembourgish stakeholders involved in Plastic Waste Management."
                ),
                hr(),
                
                # UNAMUR MASTER ----
                fluidRow(
                  style = "color: #2b3e50;",
                  h3(strong("UNIVERSITY OF NAMUR")) %>% column(width = 8),
                  h3(class = "text-right", "September 2015 - June 2018") %>% column(width = 4)
                ),
                h4(style = "color: #4d5c6b;", strong(em("Master of Business Administration, Finance Specialization, Distinction"))),
                p(
                  style = "color: #4d5c6b;",
                  a(href = "Files/Kinif_2018_Thesis.pdf", target = "_blank", strong("Thesis: ")), 
                  em("Towards Green Companies - A Panel Data Study of The Environmental and Financial Performance Nexus."),
                  "The thesis was written in", code("R | Rmarkdown | Latex"), "to make it transparent and reproducible. 
                  All resources are available on my", 
                  a(href = "https://github.com/pkinif", target = "_blank", "GitHub account"), 
                  "and can be gladly shared upon request."
                ),                
                hr(),
                
                # FEA USP ----
                fluidRow(
                  style = "color: #2b3e50;",
                  h3(strong("FEA, UNIVERSITY OF SÃO PAULO")) %>% column(width = 8),
                  h3(class = "text-right", "Jully 2016 - January 2017") %>% column(width = 4)
                ),
                h4(style = "color: #4d5c6b;", strong(em("Erasmus Mundus"))),
                p(
                  style = "color: #4d5c6b;",
                  "Using", code("Stata"), "- Writing of a scientific paper aiming at studying how eco-innovation affects financial performances of companies listed in the CAC40."
                ),                
                hr(),
                
                # UNAMUR BACHELOR ----
                fluidRow(
                  style = "color: #2b3e50;",
                  h3(strong("UNIVERSITY OF NAMUR")) %>% column(width = 8),
                  h3(class = "text-right", "September 2012 - June 2015") %>% column(width = 4)
                ),
                h4(style = "color: #4d5c6b;", strong(em("Bachelor of Business Administration"))),
                p(
                  style = "color: #4d5c6b;",
                  "Using", code("SPSS"), "- Realization of a market study measuring the level of satisfaction of patients suffering from chronic illnesses."
                ),                
                hr(),
              ),
            
              # 3.2.3 Skills ----
            
              verticalTabPanel(
                title = "SKILLS", 
                icon = icon("user-secret", "fa-2x"),
                h3(
                  style = "color: #2b3e50;",
                  strong("PROGRAMMING LANGUAGES & TOOLS")
                ),
                br(),
                
                # 3.2.3.1 Programming & Languages Tools ----
                div(
                  class = "hidden-xs hidden-sm",
                  h4(
                    style = "color: #4d5c6b;",
                    p(strong(em(
                      str_glue(
                        "R-user with {r_experience_years} years' experience, 
                      here are some of my favorites packages:"
                      )))
                    )
                  ),                  
                  br(),
                  div(
                    class = "list-inline dev-icons",
                    column(
                      width = 2,
                      img(src = "Icon/R packages/lubridate.png", style = "width: 60px;")
                    ),
                    column(
                      width = 2,
                      img(src = "Icon/R packages/shiny.png", style = "width: 60px;")
                    ), 
                    column(
                      width = 2,
                      img(src = "Icon/R packages/h2o.png", style = "width: 60px;")
                    ),                       
                    column(
                      width = 2,
                      img(src = "Icon/R packages/rmarkdown.png", style = "width: 60px;")
                    ),
                    column(
                      width = 2,
                      img(src = "Icon/R packages/plotly.png", style = "width: 60px;")
                    ),
                    column(
                      width = 2,
                      img(src = "Icon/R packages/tidyverse.png", style = "width: 60px;")
                    )
                  ),
                  br(), br(), br(),br(),
                  div(
                    class = "list-inline dev-icons",
                    column(
                      width = 2,
                      img(src = "Icon/R packages/parsnip.png", style = "width: 60px;")
                    ),                  
                    column(
                      width = 2,
                      img(src = "Icon/R packages/purr.png", style = "width: 60px;")
                    ),
                    column(
                      width = 2,
                      img(src = "Icon/R packages/rsample.png", style = "width: 60px;")
                    ),                         
                    column(
                      width = 2,
                      img(src = "Icon/R packages/lime.png", style = "width: 60px;")
                    ),                  
                    column(
                      width = 2,
                      img(src = "Icon/R packages/stringr.png", style = "width: 60px;")
                    ),
                    column(
                      width = 2,
                      img(src = "Icon/R packages/broom.png", style = "width: 60px;")
                    )                        
                  ),
                  br(),
                  br(),                  
                  h4(
                    style = "color: #4d5c6b;",
                    br(),
                    br(),
                    br(),
                    strong(em("Tools that make my Data Science journey easier:"))
                  ),
                  br(),
                  div(
                    class = "list-inline dev-icons",
                    style = "color:#122546;",
                    icon("r-project", "fa-3x") %>% column(width = 2),
                    column(
                      width = 2,
                      img(src = "Icon/rstudio.png", style = "width: 60px;")
                    ),                    
                    icon("jenkins", "fa-3x") %>% column(width = 2),
                    icon("github", "fa-3x") %>% column(width = 2),
                    icon("git", "fa-3x") %>% column(width = 2),
                    icon("docker", "fa-3x") %>% column(width = 2)
                  ),
                  br(), br(), br(),br(),
                  div(
                    class = "list-inline dev-icons",
                    column(
                      width = 2,
                      img(src = "Icon/mysql_workbench.png", style = "width: 60px;")
                    ),                        
                    column(
                      width = 2,
                      img(src = "Icon/redshift.png", style = "width: 60px;")
                    ),    
                    column(
                      width = 2,
                      img(src = "Icon/s3.png", style = "width: 90px;")
                    ),                       
                    column(
                      width = 2,
                      img(src = "Icon/EC2.png", style = "width: 60px;")
                    ),                       
                    column(
                      width = 2,
                      img(src = "Icon/bootstrap.png", style = "width: 60px;")
                    ),       
                    column(
                      width = 2,
                      img(src = "Icon/mongoDB.png", style = "width: 80px;")
                    ),                     
                    br(), 
                    br(), 
                    br(), 
                    br(), 
                    hr()                  
                  )
                ),
                div(
                  class = "hidden-lg hidden-md",
                  h4(
                    style = "color: #4d5c6b;",
                    p(strong(em(
                      str_glue(
                        "R-user with {r_experience_years} years' experience, 
                      here are some of my favorites packages:"
                      )))
                    )
                  ),                  
                  br(),
                  fluidRow(
                    style = "color:#122546;",
                    tags$ul(
                      tags$li("Lubridate"),
                      tags$li("Shiny"),
                      tags$li("H2o"),
                      tags$li("Rmarkdown")
                    ) %>% column(width = 4),
                    tags$ul(
                      tags$li("Plotly"),
                      tags$li("Tidyverse"),
                      tags$li("Parsnip"),
                      tags$li("Purr")
                    ) %>% column(width = 4),  
                    tags$ul(
                      tags$li("Rsample"),
                      tags$li("Lime"),
                      tags$li("Stringr"),
                      tags$li("Broom")
                    ) %>% column(width = 4)                 
                  ),
                  h4(
                    style = "color: #4d5c6b;",
                    br(),
                    br(),
                    strong(em("Tools that make my Data Science journey easier:"))
                  ),
                  br(),                  
                  fluidRow(
                    style = "color:#122546;",
                    tags$ul(
                      tags$li("R environment"),
                      tags$li("Rstudio"),
                      tags$li("Jenkins"),
                      tags$li("GitHub")
                    ) %>% column(width = 4),
                    tags$ul(
                      tags$li("Git"),
                      tags$li("Docker"),
                      tags$li("MySQL Workbench"),
                      tags$li("AWS Redshift")
                    ) %>% column(width = 4),  
                    tags$ul(
                      tags$li("AWS S3"),
                      tags$li("AWS EC2"),
                      tags$li("Bootstrap"),
                      tags$li("MongoDB")
                    ) %>% column(width = 4)                 
                  ),
                  hr()
                ),
                
                # 3.2.3.2 Oral Languages ----
                div(
                  h3(
                    class = "text-left text-uppercase",
                    style = "color: #2b3e50;",
                    strong("ORAL LANGUAGES")
                  ),
                  br(),
                  fluidRow(
                    style = "color:#122546;",
                    column(
                      width = 4,
                      
                      p(flag("FR"), strong("French:"), "Native Fluency")
                    ),
                    column(
                      width = 4,
                      p(flag("gb-eng"), strong("English:"), "Professional working proficiency (i.e. C1 level)")
                    ),
                    column(
                      width = 4,
                      p(flag("NL"), strong("Dutch:"), "Limited working proficiency (i.e. B1 level)")
                    )
                  )
                )
              ),
            
              
                
                
              
              # 3.2.4 Certifications ----
            
              verticalTabPanel(
                title = "CERTIFICATIONS", icon = icon("award", "fa-2x"),
                "Content panel 3"
              ),
              # 3.2.4 HOBBY ----
              
              verticalTabPanel(
                title = "INTERESTS", icon = icon("grin-hearts", "fa-2x"),
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

