#################################################################
#             Graphic 1 Makefile - script mouse                 #
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

jpeg("Figures/graphic1.jpeg")

ggplot(data = data2) +
  geom_point (aes (y = Phenotype, x = Genotype, colour = factor(Genotype))) +
  facet_wrap(~Markers)

dev.off()


