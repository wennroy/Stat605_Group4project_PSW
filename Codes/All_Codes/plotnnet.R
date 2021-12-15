library(nnet)
setwd("~/stat605/group4/tmp/birdsongWav/results")
load("model.RData")
#import function from Github
require(RCurl)

root.url<-'https://gist.githubusercontent.com/fawda123'
raw.fun<-paste(
  root.url,
  '5086859/raw/cc1544804d5027d82b70e74b83b3941cd2184354/nnet_plot_fun.r',
  sep='/'
)
script<-getURL(raw.fun, ssl.verifypeer = FALSE)
eval(parse(text = script))
rm('script','raw.fun')

plot.nnet(fit_nnet2,wts.only=T)


# library(devtools)
# library(neuralnet)
# 
# source_url('https://gist.github.com/fawda123/7471137/raw/c720af2cea5f312717f020a09946800d55b8f45b/nnet_plot_update.r')
library(neuralnet)
library(NeuralNetTools)
plotnet(fit_nnet2, alpha = 0.6)
plotnet(fit_nnet2, alpha = 0.6, skip = TRUE)