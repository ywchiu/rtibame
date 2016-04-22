shinyServer(function(input, output) {
        
        output$text <- renderText({ 
                someText = input$textInput
                someText
        })
        
}
)