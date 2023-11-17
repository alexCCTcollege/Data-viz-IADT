#install.packages("ggplot2")
#install.packages("ggmosaic")
#install.packages("plotly")

# Load the required libraries
library(ggplot2)
library(ggmosaic)
library(plotly)

# Create the long dataset using 2 list of values (company and policy type)
com <- c(rep('A', 18717), rep('B', 32086), rep('C', 40108), rep('D', 58825),
         rep('A', 355697), rep('B', 59293), rep('C', 192669), rep('D', 180000)) 
pol <- c(rep('Third Party Fire & Theft', (18717+32086+40108+58825)),
         rep('comprehensive', (355697+59293+192669+180000)))

#Dataset
dataset <- data.frame(company = com, policy = pol)

#Mosaic plot
mosaic_examp <- ggplot(data = dataset) +
  geom_mosaic(aes(x = product(company, policy), fill = company)) +   
  labs(y = "Company", x = "Type of Policy", title = "Number of Policies by Company") 


interactive_mosaic <- ggplotly(mosaic_examp)

# Display the interactive plot
interactive_mosaic

