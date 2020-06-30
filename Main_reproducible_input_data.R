#' ---
#'title: "Reproducible code for manuscript figure 03 -- Input data"
#'author: "J.A. Torres-Matallana"

#'output            : pdf_document
#'fig_caption: true
#'---

#+ code, include = TRUE

# organization 1: Luxembourg Institute of Science and Technology (LIST), Belvaux, Luxembourg
# organization 2: Wagenigen University and Research Centre (WUR), Wageningen, The Netherlands                  

# date: 27.06.2020 - 30.06.2020

#' Compile Rmarkdown file
#'---------------------------------------------------------------------------------------------
#+ compilation, echo=TRUE, eval=FALSE, include=TRUE
library("rmarkdown")
rmarkdown::render("Main_reproducible_input_data.R")

#' Setup
#' --------------------------------------------------------------------------------------------------
#+ setup, echo=TRUE, eval=TRUE, include=TRUE
library(knitr)
library(lmom)
library(tikzDevice)


Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "en_GB.UTF-8")

timing.ini <- Sys.time()


#' Plot functions
#' --------------------------------------------------------------------------------------------------
#+  plot_functions, echo=TRUE, eval=TRUE, include=TRUE


## final plot CODs

load("data/data_DWF.RData")
data <- sort(log(data[,"CODs"])) #log(CODs)

lmom <- samlmu(data, nmom=5)
parnor <- pelnor(lmom)

xmin <- min(data)
xmax <- max(data)

sfin <- seq(xmin, xmax, length.out=91)

# pdf(width = 8, height = 15, file= "output/fig03_notikz.pdf")
tikz(width = 3.5, height = 9, file= "output/fig03_canvas.tex")

par(mfrow = c(3,1))
par(mar = c(5, 5, 7, 3), cex.axis=1.4, cex.lab=1.4, cex.main=1.4) # bottom, left, top and right margins 
xlab1 <- "CODs [g/(PE d)]"
xlab <- "log(CODs [g/(PE d)])"
hist(data, breaks=50,freq = F, ylim=c(0,1.5), main = "", font.main=1,
     xlab = xlab)
lines(density(data),col="red",lwd=2, lty="dashed")
cdf <- cdfnor(x =sfin, para = parnor)
diff_cdf  <- diff(cdf)
diff_sfin <- diff(sfin)
df.CODs <- diff_cdf/diff_sfin
lines(sfin[1:90], df.CODs,col="blue",lwd=2)
xmin <- round(xmin, digits=0); xmax <- round(xmax, digits=0)
axis(side=3, at=seq(xmin,xmax,1), labels=round(exp(seq(xmin,xmax,1)), digits=0))
mtext(xlab1, side=3, line=3, cex.lab=1,las=1, col="black")



## final plot NH4s

load("data/data_DWF.RData")
data <- sort(log(data[,"NH4s"])) #log(NH4s)

lmom <- samlmu(data, nmom=5)
parnor <- pelnor(lmom)

xmin <- min(data)
xmax <- max(data)

sfin <- seq(xmin, xmax, length.out=91)

par(mar = c(5, 5, 9, 3), cex.axis=1.4, cex.lab=1.4, cex.main=1.4) # bottom, left, top and right margins 
xlab1 <- "NH4s [g/(PE d)]"
xlab <- "log(NH4s [g/(PE d)])"
hist(data, breaks=50,freq = F, ylim=c(0,2.0), xlim=c(0.5,2.5), main = "",
     xlab = xlab)
lines(density(data),col="red",lwd=2, lty="dashed")
cdf <- cdfnor(x =sfin, para = parnor)
diff_cdf  <- diff(cdf)
diff_sfin <- diff(sfin)
df.NH4s <- diff_cdf/diff_sfin
lines(sfin[1:90], df.NH4s,col="blue",lwd=2)
xmin <- round(xmin, digits=1); xmax <- round(xmax+.1, digits=1)
axis(side=3, at=seq(xmin,xmax,.5), labels=round(exp(seq(xmin,xmax,.5)), digits=1))
mtext(xlab1, side=3, line=3, cex.lab=1,las=1, col="black")




## final plot CODr

## CODr values literature (A+A)  Mean: 71 mg/l; Std dev.: 150 mg/l
logCODr <- rnorm(1e7, 3.40, 1.31) 
CODr <- exp(logCODr)
mean(CODr)   
sd(CODr)   
data <- log(CODr)

lmom <- samlmu(data, nmom=5)
parnor <- pelnor(lmom)

xmin <- min(data)
xmax <- max(data)

sfin <- seq(xmin, xmax, length.out=91)

par(mar = c(5, 5, 9, 3), cex.axis=1.4, cex.lab=1.4, cex.main=1.4) # bottom, left, top and right margins 
xlab1 <- "CODr [mg/l]"
xlab <- "log(CODr [mg/l])"
hist(data, breaks=50,freq = F, ylim=c(0,.7), xlim=c(0,6.5), 
     main = "", xlab = xlab, border = "white")
# lines(density(data),col="red",lwd=2, lty="dashed")
cdf <- cdfnor(x =sfin, para = parnor)
diff_cdf  <- diff(cdf)
diff_sfin <- diff(sfin)
df.CODr <- diff_cdf/diff_sfin
lines(sfin[1:length(df.CODr)], df.CODr,col="blue",lwd=2)
xmin <- round(xmin, digits=0); xmax <- round(xmax, digits=0)
x.at <- seq(xmin,xmax,1)
axis(side=3, at=x.at, labels=round(exp(x.at), digits=0))
mtext(xlab1, side=3, line=3, cex.lab=1,las=1, col="black")

dev.off()


#' Render latex file to pdf
#' --------------------------------------------------------------------------------------------------
#+  latex2pdf, echo=TRUE, eval=TRUE, include=FALSE
setwd("output")
system("pdflatex fig03.tex")

#' Include pdf
#' --------------------------------------------------------------------------------------------------
#+  include_pdf, echo=TRUE, eval=TRUE, include=TRUE
#' ![Figure 03.](output/fig03.pdf){width=100%}  
#' 

#' Timing
#' --------------------------------------------------------------------------------------------------
#+ timing, echo=TRUE, eval=TRUE, include=TRUE

timing.end <- Sys.time()
(timing.elapsed <- timing.end - timing.ini)