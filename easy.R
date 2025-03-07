# install.packages("devtools")
devtools::install_github("uschiLaa/pandemonium")

library(pandemonium)
pandemonium(b_anomaly$pred, b_anomaly$covInv, b_anomaly$wc, b_anomaly$exp)
