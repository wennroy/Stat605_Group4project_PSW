if (require("nnet")) { # require() is like library(), but returns TRUE or FALSE
  print("Loaded package nnet.")
} else {
  print("Failed to load package nnet.")  
}

mspectra = read.table("spec/mspectra4")
label_name = read.table("label/label_file4")
for (i in c(5:30)) {
  file = paste0("spec/mspectra",i)
  mspectra = rbind(mspectra, read.table(file))
  print(dim(mspectra))
  label_name = rbind(label_name, read.table(paste0("label/label_file",i)))
}

label = as.factor(as.matrix(label_name))
print("Loaded data.")
# fit_nnet = nnet::nnet(label~., data = mspectra, size = 8, maxit = 4000)
fit_nnet2 = nnet::nnet(label~., data = mspectra, size = 8, maxit = 4000, skip = TRUE)
# fit_nnet3 = nnet::nnet(label~., data = mspectra, size = 12, maxit = 4000, skip = TRUE)
print("Model complete.")
save(fit_nnet2, file = "model.RData")

