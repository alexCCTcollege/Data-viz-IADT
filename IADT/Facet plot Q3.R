library(ggplot2)
library(ggmosaic)
library(plotly)
install.packages("htmlwidgets")
library(htmlwidgets)

#Histogram
hist <- ggplot(CADATA_2023_, aes(x = Age, fill = .data[['Patient Type']])) +
  geom_histogram(alpha = 0.5, bins = 10) +
  facet_wrap(~Disease + Gender,ncol=2,scales = "free")

hist <- ggplotly(hist)
hist

#jitter
jitt <- ggplot(CADATA_2023_, aes(y = Age, x = Gender, color = Gender)) +
  geom_jitter(alpha = 0.9) +
  facet_wrap(~Disease + CADATA_2023_[['Patient Type']], ncol = 4, scales = "free")

jitt <- ggplotly(jitt)
jitt

#violin
viiol <- ggplot(CADATA_2023_, aes(y = Age, x=Gender, color = Gender)) +
  geom_violin(alpha = 0.9) +
  facet_wrap(~Disease +  CADATA_2023_[['Patient Type']],ncol=4,scales = "free")

viiol <-ggplotly(viiol)
viiol

#boxplot
boxp <- ggplot(CADATA_2023_, aes(y = Age, x= Gender, color=Gender)) +
  geom_boxplot( alpha = 0.9) +
  facet_wrap(~Disease + CADATA_2023_[['Patient Type']],ncol=4,scales = "free")

boxp <-  ggplotly(boxp)
boxp 
#alternative plot 
jitterplot_4D <- ggplot(CADATA_2023_, aes(x = Gender, y = Age, color = Disease, shape = .data[['Patient Type']])) +
  geom_jitter(alpha = 0.7, size=2.5) +
  labs(title = "Jitter Plot of Age by Gender and Disease and patient type",
       x = "Gender",
       y = "Age",
       color = "Disease",
       shape = "Patient Type")

jitterplot_4D <- ggplotly(jitterplot_4D)
jitterplot_4D

# save all 5 plots as html
saveWidget(jitterplot_4D, file = "Jitter_4d.html")
saveWidget(hist, file = "hist.html")
saveWidget(jitt, file = "jitt.html")
saveWidget(viiol, file = "violin.html")
saveWidget(boxp, file = "box.html")
