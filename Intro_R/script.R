###############################
# "Introduction to R"         #
# author: "Rodrigo Amadeu"    #
# date: "May 23th, 2016"  #
# rramadeu@gmail.com          #
###############################

## Creating an R script
print("Hello World!") #imprima a frase

## Saving it

## Programming practices

## Comments!



## Working Directory
getwd()
setwd("?") ##fill with your path to archives
## RStudio: Session -> Set Working Directory -> ...
## Linux =/= Windows =/= Mac






## R as calculator
3+3
(3+3)/3
9^0.5
2^10






## Functions
sqrt(9)
?sqrt
log(10)
log(x = 10,base = 10)
log(x = 10,base = 2)                            
exp(2)







## Creating objects
x <- 10
x = 10
x*2
x+x
x^x
log(x,x)






## Creating objects and class
x_name = "name"
x = 12
x_name
class(x_name)
class(x)

## Logical class
1<0
1==0
1>0
z=1<0
class(z)
is.logical(z)
is.numeric(x)
is.character(x)
is.character(x_name)





## Missing Value - be careful!
# For every class
NA
NA+1
2*NA







## Vectors
x = c(1.5, 2.1, 2.5, 3.4, 4.3, 6.1) #blank spaces not matter
y = c("A","A","B","B","C","C")

x[6]
y[2]

str(x)
str(y)

sum(x)
mean(x)
median(x)
var(x)
summary(x)
sum(y)

#Creating vector from scratch
?rep
rep(1,10)
rep(NA,5) #NA for missing data

?seq
seq(1,10,1)
seq(1,10,0.5)

## Combining
rep(seq(1,10,.5),each=2)

?sample
sample(seq(1,3,0.5),size = 5)
sample(seq(1,3,0.5),size = 5, replace = TRUE)


## Logical operators on Vector
z = x>3
z

class(z)
which(z)
x[which(z)]

#or
which(x>3)
x[which(x>3)]




## Data frame and object names
df = data.frame(x=x,y=y,z=z)

## Logical and self-explanatory
## No space, ~, `, "
df = data.frame(Producao=x,
                Cultivar=y,
                Ferrugem=z)

df$producao #R is case-sensitive
df$Producao
df$Cultivar ## String when in a df -> factor!
df$Ferrugem
str(df)

mean(df$Producao)

tapply(df$Producao,df$Cultivar,mean)
tapply(df$Producao,df$Ferrugem,mean)






## Matrices
x
matrix(x,nrow=2,ncol=3)
matrix(x,nrow=3,ncol=2,byrow=TRUE)
matrix(x,nrow=2,ncol=3,byrow=TRUE)
matrix(x,nrow=3,ncol=2,byrow=FALSE)
matrix(x,nrow=2,ncol=3,byrow=FALSE)
X <- matrix(x,nrow=3,ncol=2) #R is case-sensitive

X[3,1] #row,column
X[3,]
X[,1]
X[,1:2]

rownames(X) <- c("A","B","C")
colnames(X) <- c("R","T")

## Matrix algebra
t(X)
t(X) %*% X
crossprod(X) ## Faster!
X + 1
2*X
solve(t(X) %*% X)
solve(t(X) %*% X) + 1
X*X ## Element-wise Product | Haddamard Product 


## Lists
everything <- list(df=df,X=X)
str(everything)

## Lists
everything

everything$df
everything$X

everything[[1]]
everything[[1]][[2]]
everything[[1]][[2]][[1]]

everything[[1]][[2]][[3]]
everything[[1]][[1]][[4]]

everything[[2]]
everything[[2]][2,1]

everything[[2]][2,]
everything[[2]][,1]
everything[[2]][,"R"]










## REVIEW
## numeric, character, logical, factor
## vector, matrix, data.frame, (array), list
## how to access












## Applying to onemap data, package-specific class
library(onemap)
data(fake_f2_onemap)
fake_f2_onemap
str(fake_f2_onemap)
fake_f2_onemap$geno
colnames(fake_f2_onemap$geno)
colnames(fake_f2_onemap[[1]])

## Some packages in genetics include @ instead of $ operator, but it is the same idea.

## Reading external data
getwd()

## Using RStudio

## Using script
read.table("data.csv")
read.table("data.csv",header = TRUE, na.strings=-9, sep=",")

data=read.table("data.csv",header = TRUE, na.strings=-9, sep=",")
str(data)

write.table(data,file="data_export.csv")
write.table(data,file="data_export.csv",row.names=FALSE,quote=FALSE,na="-9")









## Reading online data
data=read.table("https://www.dropbox.com/s/20e2kwmrbbnbnrs/data.csv?raw=1",header = TRUE, na.strings=-9)
data=read.table("https://raw.githubusercontent.com/rramadeu/Tutorials_File/master/Intro_R/data.csv",header=TRUE)

## From google docs
library(gsheet)
data <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1AGGZk-KdRpGh-yLh5SV_77KTVm0vOH57pg2NpiU_Tcg')


## Installing a package
# What is a package?

## CRAN (++ reliable, ++ stable, ++ burocracy)
# https://cran.r-project.org/)
# Package onemap from cran
#install.packages("onemap")

## Bioconductor (++ reliable, stable, + burocracy)
#https://www.bioconductor.org/
# Package popr
#source("http://bioconductor.org/biocLite.R")
#biocLite("goseq")

## Another source? (reliable? stable?)
#Dev Versions or not into big repositories: github platform 
#www.github.com/augusto-garcia/onemap
#www.github.com/rramadeu/AGHmatrix

## From a tar.gz? RStudio or put the address

## If you want a Generalized Inverse? Not available on R base, but there is a package!
## So, Ginv of Moore-Penrose
install.packages("MASS") ## From command line
## Or Tools -> Install Packgaes... 
## Once installed, you can load it!
library(MASS) ## To load it always use library not require!
ginv( t(X)%*%X )











## Loading a package
#install.packages("dataset")
library(datasets)
data(mtcars)
str(mtcars)
?mtcars






## Library
mean(mtcars$mpg)
summary(mtcars)






## Graphic Plotting
head(mtcars)

## Scatterplot
plot(x=mtcars$mpg,y=mtcars$hp)

## Scatterplot
plot(x=mtcars$mpg,y=mtcars$hp, main="Scatterplot mpg x hp", 
xlab="mpg", ylab="hp")

## Histogram
hist(x=mtcars$mpg, main="Histogram of mpg", xlab="mpg")


## Density
plot(density(mtcars$mpg), main="Density", xlab="mpg")

## Boxplot
boxplot(x=mtcars$mpg, main="Boxplot of mpg", xlab="mpg")

## Boxplot by cylindrade
boxplot(mtcars$mpg ~ mtcars$cyl, main="Boxplot of mpg", xlab="mpg")






## Fitting Linear Models
#From http://augusto-garcia.github.io/R-Introduction/

genotypes <- c("AA", "aa", "aa", "Aa", "AA", "Aa")
genotypes <- c(2, 0, 0, 1, 2, 1)
phenotypes <- c(9, 4, 3, 7, 10, 8)

str(genotypes)
str(phenotypes)

genotypes <- as.numeric(genotypes)
phenotypes <- as.numeric(phenotypes)

model <- lm(phenotypes ~ genotypes)
summary(model)
tapply(phenotypes, INDEX = genotypes, FUN = mean)

plot(y=phenotypes,x=genotypes)
abline(model)

plot(y=phenotypes, x=genotypes, xaxt="n")

abline(model)
axis(side=1,at=seq(0,3,1))







## Simulating data
#http://www.stat.umn.edu/geyer/old/5101/rlook.html






#Normal Distribution
?rnorm

plot(density(rnorm(100000,0,1)))
#Distribution Family functions
rnorm(10,0,1) #“r”: random, randomly generated numbers
pnorm(0,0,1) #“p”: probability, cumulative density function
qnorm(0.5,0,1) #“q”: quantiles, cumulative density function (quantiles)
dnorm(0,0,1) #"d": density, height of the probability density function

## Simulating data
#http://www.stat.umn.edu/geyer/old/5101/rlook.html
hist(rnorm(1000,0,1))

## Simulating data with seed
set.seed(100)
hist(rnorm(1000,0,1))

set.seed(100)
rnorm(1,0,1)
rnorm(1,0,1)

set.seed(100)
rnorm(1,0,1)




## Correlation Plot
A = rnorm(50,10,6)
B = -(A-rnorm(50,10,2))
plot(A,B)

C = B+rnorm(50,10,10)
plot(A,C)
plot(B,C)


ABC <- cbind(A,B,C)
class(ABC)
dim(ABC)
head(ABC)
head(ABC,10)
tail(ABC)

#Getting the correlation matrix
var(A,B)/sqrt((var(A)*var(B)))
var(ABC[,1],ABC[,2])/sqrt((var(ABC[,1])*var(ABC[,2])))

?cor
cor(A,B)
cor(A,A)
cor.matrix = cor(ABC)
cor.matrix

#Changind the method
library(corrplot)
corrplot(cor.matrix, method="color")
?corrplot ## Help on arguments
#Corr value inside the cell (black for the color of the coef.)
corrplot(cor.matrix, method="color", addCoef.col="black")

## Exporting a graphic using RStudio

## Exporting a graphic with high quality
tiff(filename = "Rplot.tiff", width = 5, height = 5, units="in", res=300)
#Corr value inside the cell (black for the color of the coef.)
corrplot(cor.matrix, method="color", addCoef.col="black")
dev.off()

getwd()






## A little about programming concepts
## For and If structures

## For i
x=10
for( i in 1:10){
  x = x+1
}
x

## For ii
x=10
for( i in 1:10){
  x = x+1
  print(i)
}
x

## For 3
x=10
for( i in 1:10){
  x = x+1
  print(paste("i=",i,"; x=",x))
}
x

## If 1
x=0
if(x==0){
  print("x is equal 0")
}

x=1
if(x==0){
  print("x is equal 0")
}

## If 2
x=0
if(x==0){
  print("x is equal 0")
}else{
  print("x is different than 0")
}

x=1
if(x==0){
  print("x is equal to 0")
}else{
  print("x is different to 0")
}

# For + If
x=0
for(i in 1:10){
  if(x%%2==0){ ## if remainder using 2 as divisor is 0
    print(paste(x,"is even"))
  }
  if(x%%2==1){
    print(paste(x,"is odd"))
  }
  x=x+1
}

#For + If: Another way
x=0
for(i in 1:10){
  if(x%%2==0){
    print(paste(x,"is even"))
  }else{
    print(paste(x,"is odd"))
  }
  x=x+1
}

## While, the condition is on evidence
## e.g.: used on convergence algorhythm
x=1
while(x<10){
  x=x+1
}
x

## Repeat, nothing on evidence. Avoid it!
x=1
repeat{
  x=x+1
  if(x==10){
    break
  }
}

## Control flow
for(i in 1:10){
  if(i==2){
    next
  }
  if(i==7){
    break
  }
  print(i)
}

## Control flow
for(i in 1:10){
  if(i==2)
    next
  print(i)
}


## Without brackets
x=1

if(x%%2==1){
  print(paste(x,"is odd"))
}

if(x%%2==1)
  print(paste(x,"is odd"))







#One simple way to apply on genetics
#Recoding a vector
genotypes = c("AA", "aa", "aa", "Aa", "AA", "Aa",".")
n = length(genotypes)
genotypes_recoded = rep(NA,n)

for(i in 1:n){
  if(genotypes[i]=="aa"){
    genotypes_recoded[i] = 0
  }
  if(genotypes[i]=="Aa"){
    genotypes_recoded[i] = 1
  }
  if(genotypes[i]=="AA"){
    genotypes_recoded[i] = 2
  }
}

genotypes
genotypes_recoded

str(genotypes)
str(genotypes_recoded)

#CreatingFunctions

## Name, function, arguments, {}, return?

is_even = function(x){
  if(x%%2==0){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

is_even(10)
is_even(1)
x=10
is_even(x)












converting_genotypes = function(genotypes){
  n = length(genotypes)
  genotypes_recoded = rep(NA,n)
  for(i in 1:n){
    if(genotypes[i]=="aa"){
      genotypes_recoded[i] = 0
    }
    if(genotypes[i]=="Aa"){
      genotypes_recoded[i] = 1
    }
    if(genotypes[i]=="AA"){
      genotypes_recoded[i] = 2
    }
  }
  return(genotypes_recoded)
}

converting_genotypes(genotypes)
converted_gen <- converting_genotypes(genotypes)
genotypes
converted_gen

## Another way to do it.
converting_genotypes = function(genotypes){
    genotypes_recoded = matrix(NA,nrow(genotypes),ncol(genotypes),dimnames=dimnames(genotypes))
    genotypes_recoded[which(genotypes=="aa")] = 0
    genotypes_recoded[which(genotypes=="Aa")] = 1
    genotypes_recoded[which(genotypes=="AA")] = 2
  return(genotypes_recoded)
}

## Example ##
library(onemap) ## Go to inbred-based populations tutorial
data(fake_bc_onemap)
str(fake_bc_onemap)
genotypes = fake_bc_onemap$geno
genotypes[which(genotypes==0)] <- NA
phenotypes = fake_bc_onemap$pheno

pvalue_df = data.frame(marker=colnames(genotypes),
                       pvalue=NA)

for(i in 1:67){
  model = lm(phenotypes ~ genotypes[,i])
  anova = anova(model)
  pvalue_df[i,2] = anova[1,5]
}

pvalue_df$sig <- c( pvalue_df$pvalue<0.05 )


## Back to Presentation
#rramadeu@gmail.com

