## test

test_mspectra = read.table("spec/mspectra1")
test_label_name = read.table("label/label_file1")
for (i in c(2:3)) {
  file = paste0("spec/mspectra",i)
  test_mspectra = rbind(test_mspectra, read.table(file))
  print(dim(test_mspectra))
  test_label_name = rbind(test_label_name, read.table(paste0("label/label_file",i)))
}
n_test = dim(test_mspectra)[1]
test_y <- predict(fit_nnet2,newdata = test_mspectra, type = "raw")
pred_y <- predict(fit_nnet2,newdata = test_mspectra, type = "class")
test_label <- as.factor(as.matrix(test_label_name))
pred_y_fac <- factor(pred_y, levels = levels(test_label))

accu_count = 0
total_count = 0
accu_bird = numeric(13)
total_bird = numeric(13)
pred_bird = numeric(13)
for (i in c(1:length(pred_y))){
  total_count = total_count + 1
  total_bird[as.numeric(test_label[i])] = total_bird[as.numeric(test_label[i])]+ 1
  pred_bird[as.numeric(pred_y_fac[i])] = pred_bird[as.numeric(pred_y_fac[i])]+ 1
  if(pred_y[i] == test_label[i]){
    accu_count = accu_count + 1
    accu_bird[as.numeric(test_label[i])] = accu_bird[as.numeric(test_label[i])]+ 1
  }
}
accu = accu_count/total_count

p0 = accu
pe = sum(pred_bird*total_bird) / n_test^2
kappa = (p0-pe)/(1-pe)
kappa

## training



n_test = dim(mspectra)[1]
test_y <- predict(fit_nnet2,newdata = mspectra, type = "raw")
pred_y <- predict(fit_nnet2,newdata = mspectra, type = "class")
test_label <- as.factor(as.matrix(label_name))
pred_y_fac <- factor(pred_y, levels = levels(test_label))

accu_count = 0
total_count = 0
accu_bird = numeric(13)
total_bird = numeric(13)
pred_bird = numeric(13)
for (i in c(1:length(pred_y))){
  total_count = total_count + 1
  total_bird[as.numeric(test_label[i])] = total_bird[as.numeric(test_label[i])]+ 1
  pred_bird[as.numeric(pred_y_fac[i])] = pred_bird[as.numeric(pred_y_fac[i])]+ 1
  if(pred_y[i] == test_label[i]){
    accu_count = accu_count + 1
    accu_bird[as.numeric(test_label[i])] = accu_bird[as.numeric(test_label[i])]+ 1
  }
}
accu = accu_count/total_count

p0 = accu
pe = sum(pred_bird*total_bird) / n_test^2
kappa = (p0-pe)/(1-pe)
kappa

## Examples

load("model.RData")
fit_nnet2