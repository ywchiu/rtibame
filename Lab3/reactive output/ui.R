shinyUI(function(input, output) {
        
        mainPanel(
                textInput("textInput","type some text here:"),
                submitButton("Submit"),
                textOutput("text")
        )
        
}
)