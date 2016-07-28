
library(jiebaR)
library(tm)


space_tokenizer=function(x){
  unlist(strsplit(as.character(x[[1]]),'[[:space:]]+'))
}

jieba_tokenizer=function(d){
  unlist(segment(d[[1]],mixseg))
}

CNCorpus = function(d.vec){
  
  doc<-VCorpus(VectorSource(d.vec ))
  doc<-unlist(tm_map(doc,jieba_tokenizer),recursive=F)
  doc<-lapply(doc,function(d)paste(d,collapse=' '))

  Corpus(VectorSource(doc))
}
