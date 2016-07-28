
library(jiebaR)
library(tm)
DocumentTermMatrixCN = function(d.vec, wordlength = 2){
  mixseg = worker()
  
  jieba_tokenizer=function(d){
    unlist(segment(d[[1]],mixseg))
  }
  
  space_tokenizer=function(x){
    unlist(strsplit(as.character(x[[1]]),'[[:space:]]+'))
  }
  doc=VCorpus(VectorSource(d.vec ))
  doc=unlist(tm_map(doc,jieba_tokenizer),recursive=F)
  doc=lapply(doc,function(d)paste(d,collapse=' '))
  
  control.list=list(wordLengths=c(wordlength,Inf),tokenize=space_tokenizer)
  dtm=DocumentTermMatrix(Corpus(VectorSource(doc)),control=control.list)
  dtm
}
