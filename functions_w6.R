# sensitivity
Se <- function(mat) {
  apply(mat, 2, function(x) {
    TN <- x[1]
    FP <- x[2]
    TP <- x[3]
    FN <- x[4]
    TP/(TP+FN)
  })
}

# specificity
Sp <- function(mat) {
  apply(mat, 2, function(x) {
    TN <- x[1]
    FP <- x[2]
    TP <- x[3]
    FN <- x[4]
    TN/(FP+TN)
  })
}

# F1 score
F1 <- function(mat) {
  apply(mat, 2, function(x){
    TN <- x[1]
    FP <- x[2]
    TP <- x[3]
    FN <- x[4]
    2*TP/(2*TP+FP+FN)
  })
}

# geometric mean
GMean <- function(mat) {
  apply(mat, 2, function(x){
    TN <- x[1]
    FP <- x[2]
    TP <- x[3]
    FN <- x[4]
    sqrt((TP/(TP+FN))*(TP/(TP+FP)))
  })
}   

## create a wrapper function for evaluation
evaluate <- function(TN, FP, TP, FN) {
  mat <- rbind(TN, FP, TP, FN)
  met <- data.frame(Sensitivity = round(mean(Se(mat)), digits=3), 
                    Specificity = round(mean(Sp(mat)), digits=3), 
                    F1 = round(mean(F1(mat)), digits=3),
                    GMean = round(mean(GMean(mat)), digits=3))
  return(met)
  
  c("Sensitivity","Specificity","F1","GMean","Method")
  #print(c(round(mean(Se(mat)), digits=3), round(mean(Sp(mat)), digits=3), round(mean(F1(mat)), digits=3), round(mean(GMean(mat)), digits=3)))
}