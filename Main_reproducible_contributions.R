#' ---
#'title: "Reproducible code for manuscript figure 06 -- Temporal uncertainty contributions"
#'author: "J.A. Torres-Matallana"

#'output            : pdf_document
#'fig_caption: true
#'---

#+ code, include = TRUE

# organization 1: Luxembourg Institute of Science and Technology (LIST), Belvaux, Luxembourg
# organization 2: Wagenigen University and Research Centre (WUR), Wageningen, The Netherlands                  

# date: 27.06.2020 - 28.06.2020

#' Compile Rmarkdown file
#'---------------------------------------------------------------------------------------------
#+ compilation, echo=TRUE, eval=FALSE, include=TRUE
library("rmarkdown")
rmarkdown::render("Main_reproducible_contributions.R")

#' Setup
#' --------------------------------------------------------------------------------------------------
#+ setup, echo=TRUE, eval=TRUE, include=TRUE
library(knitr)

Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "en_GB.UTF-8")

timing.ini <- Sys.time()

#' Loading functions
#' --------------------------------------------------------------------------------------------------
#+  load_functions, echo=TRUE, eval=TRUE, include=TRUE
source(paste0("R/", "Plot.stacked1.R"))

#' Stacked line plot
#' --------------------------------------------------------------------------------------------------
#+  plot_stacked, echo=TRUE, eval=TRUE, include=TRUE

## call function Plot.stacked
My.plot.composed.contrib <- function(x.axis.null = TRUE){
  p.c1 <- Plot.stacked1(data.bar = data.bar,
                        time.plot.ini <- as.POSIXct("2010-03-20 19:00:00"),
                        time.plot.end <- as.POSIXct("2010-03-21 07:00:00"),
                        breaks.by = 60*60*3,
                        xlab = "", 
                        ylab = paste0("Var. ", ylab, "$^2$")
  )
  if(x.axis.null) {p.c1 <- p.c1 + theme(axis.text.x = element_blank())}
  
  p.c2 <- Plot.stacked1(data.bar = data.bar,
                        time.plot.ini <- as.POSIXct("2010-05-28 07:00:00"),
                        time.plot.end <- as.POSIXct("2010-05-30 06:00:00"),
                        breaks.by = 60*60*3,
                        xlab = "", 
                        ylab = paste0("Var. ", ylab, "$^2$")
  )
  if(x.axis.null) {p.c2 <- p.c2 + theme(axis.text.x = element_blank())}
  
  p.c3 <- Plot.stacked1(data.bar = data.bar,
                        time.plot.ini <- as.POSIXct("2010-08-26 20:00:00"),
                        time.plot.end <- as.POSIXct("2010-08-27 17:00:00"),
                        breaks.by = 60*60*3,
                        xlab = "", 
                        ylab = paste0("Var. ", ylab, "$^2$")
  )
  if(x.axis.null) {p.c3 <- p.c3 + theme(axis.text.x = element_blank())}
  
  p.c4 <- Plot.stacked1(data.bar = data.bar,
                        time.plot.ini <- as.POSIXct("2010-09-07 02:00:00"),
                        time.plot.end <- as.POSIXct("2010-09-09 02:00:00"),
                        breaks.by = 60*60*3,
                        xlab = "", 
                        ylab = paste0("Var. ", ylab, "$^2$")
  )
  if(x.axis.null) {p.c4 <- p.c4 + theme(axis.text.x = element_blank())}
  
  return(list(p.c1, p.c2, p.c3, p.c4))
}

#' Loading data and plotting contributions
#' --------------------------------------------------------------------------------------------------
#+  load_data, echo=TRUE, eval=TRUE, include=TRUE

## bcod contributions
load("data/data_BCOD_plot.RData")
p.bcod <- My.plot.composed.contrib()
# p.bcod[[2]]

## bnh4 contributions
load("data/data_BNH4_plot.RData")
p.bnh4 <- My.plot.composed.contrib()
# p.bnh4[[2]]

## ccod contributions
load("data/data_CCOD_plot.RData")
p.ccod <- My.plot.composed.contrib()
# p.ccod[[2]] 

## cnh4 contributions
load("data/data_CNH4_plot.RData")
p.cnh4 <- My.plot.composed.contrib(x.axis.null = FALSE)
# p.cnh4[[2]] 

#' Plot graphs and set relative heights
#' --------------------------------------------------------------------------------------------------
#+  plot_final, echo=TRUE, eval=TRUE, include=FALSE
library(gridExtra)
library(tikzDevice)

# final fig06 to HESS paper
# pdf(file = paste0("output/contributions_all_",as.Date("2010-05-28 05:00:00"),"_", as.Date("2010-09-09 02:00:00"), ".pdf"), width = 22, height = 22)
tikz(file = paste0("output/contributions_all_",as.Date("2010-05-28 05:00:00"),"_", as.Date("2010-09-09 02:00:00"), ".tex"), width = 22, height = 22)
grid.arrange(p.bcod[[2]], p.bcod[[4]],p.bnh4[[2]], p.bnh4[[4]],
             p.ccod[[2]], p.ccod[[4]],p.cnh4[[2]], p.cnh4[[4]],
             heights = c(.93/4, .93/4, .93/4, 1.35/4), nrow = 4)
dev.off()

#' Render latex file to pdf
#' --------------------------------------------------------------------------------------------------
#+  latex2pdf, echo=TRUE, eval=TRUE, include=FALSE
setwd("output")
system("pdflatex fig06.tex")

#' Include pdf
#' --------------------------------------------------------------------------------------------------
#+  include_pdf, echo=TRUE, eval=TRUE, include=TRUE
#' ![Figure 06.](output/fig06.pdf){width=100%}  
#' 

#' Timing
#' --------------------------------------------------------------------------------------------------
#+ timing, echo=TRUE, eval=TRUE, include=TRUE

timing.end <- Sys.time()
(timing.elapsed <- timing.end - timing.ini)

