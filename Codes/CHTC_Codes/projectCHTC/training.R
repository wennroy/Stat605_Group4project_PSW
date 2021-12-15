if (require("nnet")) { # require() is like library(), but returns TRUE or FALSE
  print("Loaded package nnet.")
} else {
  print("Failed to load package nnet.")  
}

mspectra = read.table("spec/mspectra4")
label_name = read.table("label/label_file4")
for (i in c(5:30)) {
  file = paste0("spec/","mspectra",i)
  mspectra = rbind(mspectra, read.table(file))
  label_name = rbind(label_name, read.table(paste0("label/label_file",i)))
}

label = as.factor(label_name)
print("Loaded data.")
fit_nnet = nnet::nnet(label~., data = mspectra, size = 8, skip = TRUE, maxit = 4000)
print("Model complete.")
save(fit_nnet, "model.RData")