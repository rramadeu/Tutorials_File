###############################
# "For and matrix operations" #
# author: "Rodrigo Amadeu"    #
# date: "May 23th, 2016"      #
# rramadeu@gmail.com          #
###############################

## In order to build a data.frame matching MAPMAKER standards
## we need to make the following convertion: everything which 
## is 1 turns "H" and everything which is 0 turns "A". 
## We can do it by several features, here we present 2 looping 
## ways and 1 matricial way.


df <- data.frame(IND=seq(1:100),
                 TRAIT=round(rnorm(100,50,10),0),
                 M1=sample(0:1,100,replace=TRUE),
                 M2=sample(0:1,100,replace=TRUE),
                 M3=sample(0:1,100,replace=TRUE),
                 M4=sample(0:1,100,replace=TRUE),
                 M5=sample(0:1,100,replace=TRUE),
                 M6=sample(0:1,100,replace=TRUE),
                 M7=sample(0:1,100,replace=TRUE),
                 M8=sample(0:1,100,replace=TRUE))



## Selecting just the marker matrix
marker.matrix <- df[,c(3:10)]
head(marker.matrix)


## catches how many columns and rows our matrix (hereafter mm) has.
col.mm <- ncol(marker.matrix)
row.mm <- nrow(marker.matrix)


########################
## First Loop         ##
## Using nested loops ##
########################
## creating an empty object to be filled
mod.mm.1 <- matrix(NA,row.mm,col.mm)

## looping in row inside col
## in this loop we check every element of the vectors as an scalar
## and change the corresponded value on the new matrix.
for(i in 1:col.mm){ ## goes in every col
    for(j in 1:row.mm){ ## goes in every row within col
        if(marker.matrix[j,i]==1){
            mod.mm.1[j,i]<-"H"
        }
        if(marker.matrix[j,i]==0){
            mod.mm.1[j,i]<-"A"
        }
    }
}


########################
## Second Loop        ##
## Using one loop     ##
########################
## creating an empty object to be filled
mod.mm.2 <- matrix(NA,row.mm,col.mm)

## looping in row inside col
## in this loop we check the entire vector
## and change the all the vector value on the new matrix.
for(i in 1:col.mm){ ## goes in every col
    temp <- which(marker.matrix[,i]==1) ## getting who is 1
    mod.mm.2[temp,i] <- "H"
    temp <- which(marker.matrix[,i]==0) ## getting who is 0
    mod.mm.2[temp,i] <- "A"
}

########################
## Another way        ##
## Matrix             ##
########################
## creating an empty object to be filled
mod.mm.3 <- matrix(NA,row.mm,col.mm)

mod.mm.3[marker.matrix==1] <- "H"
mod.mm.3[marker.matrix==0] <- "A"

#####################################
## Improving the another way       ##
## Matrix                          ##
#####################################
## As we just have A or H, we can make it in 1 line operation
mod.mm.4 <- matrix(NA,row.mm,col.mm)
mod.mm.4 <- ifelse(marker.matrix==1,"H","A")


#####################################
## With >=3 factors                ##
## Matrix                          ##
#####################################
## If we have 3 class (A,B,H) we could do it using a similar approach with nesteds ifelse()'s, e.g.:
mod.mm.example <- ifelse(marker.matrix==1,"H",
                         ifelse(marker.matrix==0,"A","B"))   

## Checking if all the results are the same
which(mod.mm.1!=mod.mm.2)
which(mod.mm.2!=mod.mm.3)
which(mod.mm.3!=mod.mm.4)

## In these examples we do not consider missing data. If it is your case, consider it.
