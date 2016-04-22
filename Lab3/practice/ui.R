library(shiny)

shinyUI(fluidPage(
        
        titlePanel("Apple News Tracer"),
        
        fluidRow(
                column(4,
                       wellPanel(
                               h4('Filter:'),
                               checkboxGroupInput("categories",
                                                  "Category",
                                                  categories,
                                                  selected = categories)   
                       ),
                       wellPanel(
                               h4('Keyword Distribution:'),
                               htmlOutput("newspiechart")
                       )
                ),
                column(8,
                       wellPanel(
                               h4('Keyword Volume:'),
                               br(),
                               textInput("keyword",
                                         "Search",     
                                         width='250px',
                                         placeholder="中國"
                                         ),
                               htmlOutput("volume")
                        )       
                )
        ),
        fluidRow(
                column(12,
                       tableOutput("newstable")
                )
        )
))