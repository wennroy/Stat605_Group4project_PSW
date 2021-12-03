args = (commandArgs(trailingOnly=TRUE))
if (length(args) != 1){
  stop("usage: Rscript hw4.R <Data_file_name>")
}

if (require("tuneR")) { # require() is like library(), but returns TRUE or FALSE
  print("Loaded package FITSio.")
} else {
  print("Failed to load package FITSio.")  
}
if (require("seewave")) { # require() is like library(), but returns TRUE or FALSE
  print("Loaded package sswave.")
} else {
  print("Failed to load package seewave.")  
}
# if (require("nnet")) { # require() is like library(), but returns TRUE or FALSE
#   print("Loaded package nnet.")
# } else {
#   print("Failed to load package nnet.")  
# }

file_name = args[1]
wl <- 64
all_files <- dir(paste0(file_name,"/"))
n = length(all_files)
mspectra <- matrix(NA, nrow=wl/2, ncol=n)
label_file <- array(NA, dim=c(n,1))

extract_bird<- function(x){
  substring(x,1,6)
}

i = 0
for (file in all_files){
  i = i + 1
  label_file[i] <- extract_bird(file)
  sample_audio = readWave(paste0(file_name,'/',file))
  # Cut the audio whose frequence < 1500
  sample_audio_fir = fir(sample_audio, from=1500, to = NULL, output = "Wave")
  
  mspectra[,i] <- meanspec(sample_audio_fir,
                           wl=wl, plot=FALSE)[,2]
  
}

write.table(t(mspectra),file = paste0('mspectra',file_name))
write.table(label_file, file = paste0('label_file',file_name))