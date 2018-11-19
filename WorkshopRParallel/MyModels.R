## Workshop R Parallel
## Nov 19th 2018
## Rodrigo R Amadeu
## rramadeu at ufl dot edu

## Creating Models

## Loading my dataset
load("data/SolData.Rdata")

## Building models outside the loop
ETA <- list(PED1=list(X=M, model="BRR",saveEffects=FALSE))
save(ETA,file="models/ETA_1.Rdata")
ETA <- list(PED1=list(X=M, model="BL",saveEffects=FALSE))
save(ETA,file="models/ETA_2.Rdata")
