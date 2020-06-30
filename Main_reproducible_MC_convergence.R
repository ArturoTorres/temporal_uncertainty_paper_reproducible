#' ---
#'title: "Reproducible code for manuscript figure 04 -- Monte Carlo convergence test"
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
rmarkdown::render("Main_reproducible_MC_convergence.R")

#' Setup
#' --------------------------------------------------------------------------------------------------
#+ setup, echo=TRUE, eval=TRUE, include=TRUE
library(knitr)
library(tikzDevice)
library(stUPscales)

Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "en_GB.UTF-8")

timing.ini <- Sys.time()

folder.current <- getwd()

#' Plot function
#' --------------------------------------------------------------------------------------------------
#+  plot_function, echo=TRUE, eval=TRUE, include=TRUE

Plot.Convergence <- function(summ1, summ2, var.name, label, n){
  eval <- cbind.data.frame(mc1=summ1[[var.name]][,"Sd"], mc2=summ2[[var.name]][,"Sd"])
  gof <- round(GoF(eval, col_sim = 1 , col_obs = 2, name = var.name), digits = 3)
  
  tikz(paste0("output/MC_convergence/Convergence_",var.name,"_", n, "sims", ".tex"), width = 10, height = 10)
  
  par(mar = c(9, 9, 2, 2), cex.axis = 3.3,  padj = 2)
  ylim <- c(0, 1.1*max(summ1[[var.name]][,"Sd"], summ2[[var.name]][,"Sd"]))
  xlim <- ylim
  plot(x = summ1[[var.name]][,"Sd"], y = summ2[[var.name]][,"Sd"],
       xlim = xlim, ylim = ylim, ann = FALSE, xaxt='n')
  abline(a=0, b=1, lty=2, pch=0, col="blue")
  # abline(a=120, b=0, lty=2, pch=0, col="blue")
  # abline(v=120, lty=2, pch=0, col="blue")
  axis(side=1, las = 1, cex.axis=3.3, las = 1, padj = 0.6)
  mtext(side = 1, text = paste("SD MC1 (", label, ")", sep = ""), line = 6,
        cex = 3.8)
  mtext(side = 2, text = paste("SD MC2 (", label, ")", sep = ""), line = 5,
        cex = 3.8)
  legend("topleft", paste(n, " simulations ", "\n(NSE = ",gof[9], ")",sep=""),
         lty=NULL, col=c("blue"), cex=3.8, bty="n")
  dev.off()
  
  gof[9]
}

#' Load data and plot by tikzDevice (MC = 250 runs)
#' --------------------------------------------------------------------------------------------------
#+  load_plot_250, echo=TRUE, eval=TRUE, include=FALSE
load("data/summ1_mc250.RData")
summ1 <- summ

load("data/summ2_mc250.RData")
summ2 <- summ

n <- 250

# overflow volume
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.Vov",    label="Volume overflow [m3]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_Vov_250sims.tex")

# overflow BCOD
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.BCODov",    label="Overflow COD load [Kg]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_BCODov_250sims.tex")


# overflow BNH4
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.BNH4ov",    label="Overflow NH4 load [Kg]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_BNH4ov_250sims.tex")

#' Load data and plot by tikzDevice (MC = 1000 runs)
#' --------------------------------------------------------------------------------------------------
#+  load_plot_1000, echo=TRUE, eval=TRUE, include=FALSE
setwd(folder.current)
load("data/summ1_mc1000.RData")
summ1 <- summ

load("data/summ2_mc1000.RData")
summ2 <- summ

n <- 1000

# overflow volume
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.Vov",    label="Volume overflow [m3]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_Vov_1000sims.tex")

# overflow BCOD
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.BCODov",    label="Overflow COD load [Kg]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_BCODov_1000sims.tex")


# overflow BNH4
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.BNH4ov",    label="Overflow NH4 load [Kg]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_BNH4ov_1000sims.tex")

#' Load data and plot by tikzDevice (MC = 1500 runs)
#' --------------------------------------------------------------------------------------------------
#+  load_plot_1500, echo=TRUE, eval=TRUE, include=FALSE
setwd(folder.current)
load("data/summ1_mc1500.RData")
summ1 <- summ

load("data/summ2_mc1500.RData")
summ2 <- summ

n <- 1500

# overflow volume
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.Vov",    label="Volume overflow [m3]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_Vov_1500sims.tex")

# overflow BCOD
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.BCODov",    label="Overflow COD load [Kg]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_BCODov_1500sims.tex")


# overflow BNH4
setwd(folder.current)
Plot.Convergence(summ1, summ2, var.name="summ.BNH4ov",    label="Overflow NH4 load [Kg]", n)

setwd("output/MC_convergence")
system("pdflatex Convergence_BNH4ov_1500sims.tex")

#' Render latex file to pdf (final)
#' --------------------------------------------------------------------------------------------------
#+  latex2pdf_final, echo=TRUE, eval=TRUE, include=FALSE
setwd("output")
system("pdflatex fig04.tex")

#' Include pdf
#' --------------------------------------------------------------------------------------------------
#+  include_pdf, echo=TRUE, eval=TRUE, include=TRUE
#' ![Figure 04.](output/fig04.pdf){width=100%}  
#' 

#' Timing
#' --------------------------------------------------------------------------------------------------
#+ timing, echo=TRUE, eval=TRUE, include=TRUE

timing.end <- Sys.time()
(timing.elapsed <- timing.end - timing.ini)