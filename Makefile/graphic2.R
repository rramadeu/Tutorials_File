#################################################################
#             Graphic 2 Makefile - script mouse                 #
#                       November/2015                           #
#           Cristiane Taniguti and Letícia Lara                 #
#################################################################

library(ggplot2)
library(dplyr)
library(tidyr)

data1 <- read.csv("mouse.csv")

data2 <- data1 %>%
  gather(IND, BW, starts_with('M'))   
colnames(data2) <- c("ID", "Phenotype", "Markers", "Genotype")

jpeg("Figures/graphic2.jpeg")

ggplot (data = data2) +
  geom_boxplot (aes (y = Phenotype, x = as.factor(Genotype), fill = factor(Genotype))) +
  facet_wrap(~Markers) +
  xlab("Markers")

dev.off()

