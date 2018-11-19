## Workshop R Parallel
## Nov 19th 2018
## Rodrigo R Amadeu
## rramadeu at ufl dot edu

## Loading my dataset
load("data/SolData.Rdata")

## CV 5-folds
tst.pop <- rep(1:5,length=549)
set.seed(1234)
tst.pop <- sample(tst.pop,549,FALSE)

## Index data.frame to loop
index <- expand.grid(k=1:5,ETA=1:2)
x <- 1:nrow(index)

## Creating a function to put in the loop
fit.BGLR <- function(x){
  
  ## You need to call the library inside the function
  library(BGLR)
  
  ## Collecting Loop Info
  k=index$k[x]
  ind.eta = index$ETA[x]  
  
  ## Which ETA
  load(paste0("models/ETA_",ind.eta,".Rdata"))
  
  ## Which k-fold
  y.trn <- y
  y.trn[tst.pop==k] <- NA
  
  ## Fit model
  fit <- BGLR(y.trn, ETA=ETA,
              nIter = 100, burnIn = 50,thin = 5, 
              verbose = FALSE, saveAt = paste0("output/model_",ind.eta,"_",k))
  
  ## Statistics
  pa <- cor(fit$yHat[tst.pop==k],y[tst.pop==k])
  rmse <- mean((fit$yHat[tst.pop==k]-y[tst.pop==k])^2)
  
  system(paste0("echo '",paste(k,ind.eta,pa,rmse),"' >> output.txt"))
}

## Parallel
library(parallel)
no_cores <- as.integer(Sys.getenv("SLURM_CPUS_ON_NODE"))-1
cl <- makeCluster(no_cores)
clusterExport(cl=cl,varlist = list("y","index","tst.pop"))
system.time(
  out <- parLapply(cl, x, fit.BGLR)
)
stopCluster(cl)
