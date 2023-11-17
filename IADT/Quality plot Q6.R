library(ggplot2)
library(ggQC)

mean(SPC$Defectives)
sd(SPC$Defectives)
sum(SPC$Defectives)

XmR_Plot <- ggplot(SPC, aes(x = Day, y = Defectives)) +geom_point() + geom_line() + stat_QC(method = "np",n = 50,show.1n2.sigma = F, auto.label = T, label.digits = 2)
XmR_Plot
