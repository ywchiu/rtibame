shinyServer(function(input, output) {
        
        output$text <- renderText({ 
                textOutput = input$textInput
                textOutput
        })
        
}
)