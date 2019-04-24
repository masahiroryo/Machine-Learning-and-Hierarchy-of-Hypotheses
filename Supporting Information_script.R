## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(fig.width=9, fig.height=8) 

## ----reading the dataset-------------------------------------------------
data = data.frame(read.csv("Supporting information_dataset.csv"))
data = data[which(!is.na(data[,1])),1:ncol(data)]
head(data, 3)

## ----levels--------------------------------------------------------------
data$Response = factor(data$Response, levels = c("S", "I", "Q"))


## ----package install, message=FALSE, warning=FALSE-----------------------
if(!"partykit" %in% rownames(installed.packages())) install.packages("partykit")
library("partykit")

## ----modeling------------------------------------------------------------
ctree.mdl = partykit::ctree(Response~., data=data, 
              control = ctree_control(mincriterion =  0.95, testtype="Univariate"))

## ----plotting------------------------------------------------------------
plot(ctree.mdl, gp = gpar(cex= 0.8),
     inner_panel=node_barplot(ctree.mdl, fill=c("#22b14cff","#e6e6e6ff","#ed1c24ff"), gp = gpar(cex= 0.6)),
     terminal_panel=node_barplot(ctree.mdl, fill=c("#22b14cff","#e6e6e6ff","#ed1c24ff")),
     ep_args = c(just="increasing", justmin=1))


## ----plotting cf1--------------------------------------------------------
plot(ctree.mdl)


## ----plotting cf2--------------------------------------------------------
plot(ctree.mdl, inner_panel=node_barplot)


## ----dataset-------------------------------------------------------------
data

