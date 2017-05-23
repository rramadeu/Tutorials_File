##


library(gsheet)
mouse <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1fLB4LRhfcl9hWYRorzsogQ9MJXrOWxcFJ5pqUXhI83E')
mouse <- as.data.frame(mouse)
head(mouse)

## In order to build a data.frame matching MAPMAKER stander, we need to make the following convertion: everything which is 1 turns "H" and everything which is 0 turns "A". We can do it by several features, here we present 2 looping ways and 1 matricial way.

## Selecting just the marker matrix
marker.matrix <- mouse[,c(3:16)]
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
