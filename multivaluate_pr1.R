install.packages("symbols")
install.packages("aplpack")
install.packages("scatterplot3d")
install.packages("corrplot")
install.packages("ggplot2")
install.packages("ggcorrplot")
install.packages("GGally")
install.packages("plotly")
library(plotly)
library(symbols)
## Loading required package: shape
library(aplpack)
library(scatterplot3d)
library(corrplot)
## corrplot 0.90 loaded
##
## Attaching package: 'corrplot'
## The following object is masked from 'package:shape':
##
## colorlegend
library(ggplot2)
library(ggcorrplot)
library(GGally)
## Registered S3 method overwritten by 'GGally':
## method from
## +.gg ggplot2



# Read data file and store in data frame
raw_data <- read.csv("PanTHERIA_1-0_WR05_Aug2008.txt", sep = "\t")
# Set row names to species name
rownames(raw_data) <- raw_data$MSW05_Binomial
# Keep only relevant variables
raw_data_vars <- raw_data[,c(7, 9, 16, 21, 22, 23)]
# Give readable column names
colnames(raw_data_vars) <- c("body_mass_g", "body_length_mm", "gestation_length_d",
                             "litter_size", "litters_per_year", "longevity_m")
# Find indices of rows that have missing values (equal to -999)
which_na <- sapply(1:nrow(raw_data_vars), function(i) any(raw_data_vars[i,] == -999))
# Remove those rows from data
data <- raw_data_vars[!which_na,]


head(data)
plot(data$body_mass_g, data$body_length_mm)
scatterplot3d(data$body_mass_g, data$body_length_mm, data$litter_size)
scatterplot3d(data$body_mass_g, data$body_length_mm, data$litter_size, angle = 120)

pairs(data)



cor(data)
## symmetric matrix

## 7.
corrplot(cor(data))
## biggest positive correlation: body_mass, body_length
## biggest negative correlation: litter_size, gestation_length

## 8.
data_subset <- data[1:20,]
data_subset


## 9.
install.packages("MASS")
library("MASS")
parcoord(data_subset)
