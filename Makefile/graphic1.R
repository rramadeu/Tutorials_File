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
  select(IND, BW, starts_with('M')) %>%
  pivot_longer(starts_with('M'), names_to = "Markers", values_to = "Genotype") %>%
  rename(ID = "IND",
         Phenotype = "BW")

jpeg("Figures/graphic1.jpeg")

ggplot(data = data2) +
  geom_point (aes (y = Phenotype, x = Genotype, colour = factor(Genotype))) +
  facet_wrap(~Markers)

dev.off()


