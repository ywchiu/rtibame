library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        h3("Sidebar Layout"),
        sidebarLayout(
                sidebarPanel( "sidebar panel"),
                mainPanel("main panel")
        ),
        sidebarLayout(position = "right",
                sidebarPanel( "sidebar panel"),
                mainPanel("main panel")
        ),
        h3("Flow Layout"),
        flowLayout(
                numericInput("rows", "How many rows?", 5),
                selectInput("letter", "Which letter?", LETTERS),
                sliderInput("value", "What value?", 0, 100, 50),
                br()
                
        ),
        h3("Split Layout"),
        splitLayout(cellWidths = c("25%", "50%","25%"),
                img(src = "https://www.rstudio.com/wp-content/uploads/2014/06/RStudio-Ball.png", height = 72, width = 72),
                img(src = "https://www.rstudio.com/wp-content/uploads/2014/06/RStudio-Ball.png", height = 72, width = 72),
                img(src = "https://www.rstudio.com/wp-content/uploads/2014/06/RStudio-Ball.png", height = 72, width = 72)
        ),
        br(),
        h3("Vertical Layout"),
        verticalLayout(
                a(href="http://example.com/link1", "Link One"),
                a(href="http://example.com/link2", "Link Two"),
                a(href="http://example.com/link3", "Link Three")
        ),
        h3("Fluid Row"),
        fluidRow(
                column(width = 4,
                       "4"
                ),
                column(width = 3, offset = 2,
                       "3 offset 2"
                )
        ),
        headerPanel("header panel"),
        titlePanel("title panel"),
        inputPanel("inputPanel"),
        wellPanel("well panel"),
        sidebarLayout(
                sidebarPanel( "sidebar panel"),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Plot", plotOutput("plot")),
                                tabPanel("Summary", verbatimTextOutput("summary")),
                                tabPanel("Table", tableOutput("table"))
                        )
                )
        ),
        titlePanel("Basic widgets"),
        
        fluidRow(
                
                column(3,
                       h3("Buttons"),
                       actionButton("action", label = "Action"),
                       br(),
                       br(), 
                       submitButton("Submit")),
                
                column(3,
                       h3("Single checkbox"),
                       checkboxInput("checkbox", label = "Choice A", value = TRUE)),
                
                column(3, 
                       checkboxGroupInput("checkGroup", 
                                          label = h3("Checkbox group"), 
                                          choices = list("Choice 1" = 1, 
                                                         "Choice 2" = 2, "Choice 3" = 3),
                                          selected = 1)),
                
                column(3, 
                       dateInput("date", 
                                 label = h3("Date input"), 
                                 value = "2014-01-01"))   
        ),
        
        fluidRow(
                
                column(3,
                       dateRangeInput("dates", label = h3("Date range"))),
                
                column(3,
                       fileInput("file", label = h3("File input"))),
                
                column(3, 
                       h3("Help text"),
                       helpText("Note: help text isn't a true widget,", 
                                "but it provides an easy way to add text to",
                                "accompany other widgets.")),
                
                column(3, 
                       numericInput("num", 
                                    label = h3("Numeric input"), 
                                    value = 1))   
        ),
        
        fluidRow(
                
                column(3,
                       radioButtons("radio", label = h3("Radio buttons"),
                                    choices = list("Choice 1" = 1, "Choice 2" = 2,
                                                   "Choice 3" = 3),selected = 1)),
                
                column(3,
                       selectInput("select", label = h3("Select box"), 
                                   choices = list("Choice 1" = 1, "Choice 2" = 2,
                                                  "Choice 3" = 3), selected = 1)),
                
                column(3, 
                       sliderInput("slider1", label = h3("Sliders"),
                                   min = 0, max = 100, value = 50),
                       sliderInput("slider2", "",
                                   min = 0, max = 100, value = c(25, 75))
                ),
                
                column(3, 
                       textInput("text", label = h3("Text input"), 
                                 value = "Enter text..."))   
        ),
        br(),
        h3("Our First React Output"),
        mainPanel(
                textInput("textInput","type some text here:"),
                submitButton("Submit"),
                textOutput("text")
        )
        
))