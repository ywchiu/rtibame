library(shiny)
library(googleVis)
library(ggplot2)
library(dplyr)
library(reshape)

shinyServer(function(input, output) {
        
        kwd <- reactive({
                input$keyword
        })
        
        cs <- reactive({
                input$categories
        })
        
        data_filter <- function(kwd,cs){
                if(kwd == '' || is.na(kwd)) filter(applenews,category %in% cs) 
                else filter(applenews,category %in% cs, grepl(kwd,content))               
        }
        
        news = reactive({
                cs <- cs()
                kwd <- kwd()
                data_filter(kwd,cs)
        })
        
        kwd_pie <- reactive({
                cs <- cs()
                kwd <- kwd()
                news_df <- data_filter(kwd,cs)
                data <- as.data.frame(table(news_df$category))
                gvisPieChart(data,option=list(slices="{1:{offset:0.2}}"))
        })
        
        kwd_plot = reactive({
                kwd <- kwd()
                if(kwd == '') gvisLineChart(data.frame(x=0,y=0), options=list( legend="none"))
                else{cs <- cs()
                     news_df <- data_filter(kwd,cs)
                     news_df <- news_df %>% 
                             arrange(date)
                     data <- as.data.frame(table(news_df$date,news_df$category),stringsAsFactors=FALSE)
                     names(data) <- c("date","category","count")
                     data2 <- as.data.frame(cast(data,date~category))
                     gvisLineChart(data2, 
                                   "date", 
                                   names(data2)[names(data2)!='date'],
                                   options=list(height=415))
                     #ggplot(data,aes(x=date,y=count,group=category)) +
                     #        geom_line(aes(colour=category)) +
                     #        theme(text=element_text(family="STKaiti",size=14),
                     #              axis.text.x=element_text(angle=45,hjust=1),
                     #              panel.background = element_rect(fill = 'white', colour = 'white'))
                } 
        })
        
        output$newstable <- renderTable({
                news()
        })
        
        output$newspiechart <- renderGvis({
                kwd_pie()
        })
        
        output$volume <- renderGvis({
                kwd_plot()
        }) 
})