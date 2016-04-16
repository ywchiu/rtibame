getArticle <- function(ele){
  e <- read_html(ele) 
  content= e %>% html_nodes('.articulum.trans') %>% 
    html_text() %>% 
    iconv(from='UTF-8', to='UTF-8')
  title <- e %>% html_nodes('#h1') %>% 
    html_text() %>% 
    iconv(from='UTF-8', to='UTF-8')
  dt <- e %>% html_nodes('.gggs time') %>% 
    html_text() %>% 
    iconv(from='UTF-8', to='UTF-8')
  category <- e %>% 
    iconv(from='UTF-8', to='UTF-8') %>%
    gsub(pattern='.*"keywords": \\["(.+?)"\\].*', '\\1', x=.)
  clicked <- e %>% html_nodes('.clicked') %>% 
    html_text() %>% 
    iconv(from='UTF-8', to='UTF-8')  
  data.frame(content = content, title = title, dt=dt,category=category, 
             clicked=clicked,stringsAsFactors = FALSE )
}


getURL <- function(newsurl){
  apple <- read_html(newsurl, encoding="UTF-8")  
  rtddt <- apple %>% html_nodes('.rtddt')  
  url <- rtddt %>% html_nodes('a') %>% html_attr('href')
  url <- gsub(domain, "", url)
  url <- paste0(domain, url) 
  df <- lapply(url, getArticle)
  
  dfall <- do.call("rbind", df)
  dfall
} 	

domain = 'http://www.appledaily.com.tw'
pageurl <- 'http://www.appledaily.com.tw/realtimenews/section/new/'
dfall <- lapply(1:50, 
                function(i){
                  url <- paste0(pageurl, i)
                  df <- getURL(url)
                } 
)

