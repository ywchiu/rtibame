library(rvest)
newsurl <- read_html('http://news.ltn.com.tw/list/breakingnews') %>% html_nodes('a.tit') %>% html_attr('href')

con <- file('C:\\Program Files\\R\\R-3.3.2\\library\\jiebaRD\\dict\\user.dict.utf8', 'a', encoding = "UTF-8")

for (news in newsurl){
  
  keywords <- read_html(news) %>% html_nodes('.keyword a') %>% html_text()
  for (w in keywords){
    cat(paste(w,'\n'), file= con)
  }
}
close(con)