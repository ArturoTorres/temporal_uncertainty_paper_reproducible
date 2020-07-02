# Temporal Uncertainty Paper Reproducible Figures
This repository contains the R code and data to reproduce figures from the "Multivariate autoregressive 
modelling and conditional simulation for temporal uncertainty propagation in urban water systems" paper.

In order to reproduce Figure 03 proceed as follows:

1. If not already installed, install the required R-packages: rmarkdown, knitr, lmom, tikzDevice
2. Execute R file "Main_reproducible_input_data.R" e.g. source("Main_reproducible_input_data.R", echo = TRUE)
3. Check outputs
3.1. Reproducible rmarkdown report in file "Main_reproducible_input_data.pdf"
3.2. Individual Figure 03 in file "output/fig03.pdf"

In order to reproduce Figure 04 proceed as follows:

1. If not already installed, install the required R-packages: rmarkdown, knitr, tikzDevice, stUPscales
2. Execute R file "Main_reproducible_input_data.R" e.g. source("Main_reproducible_MC_convergence.R", echo = TRUE)
3. Check outputs
3.1. Reproducible rmarkdown report in file "Main_reproducible_MC_convergence.pdf"
3.2. Individual Figure 04 in file "output/fig04.pdf"
  
In order to reproduce Figure 05 proceed as follows:

1. If not already installed, install the required R-packages: rmarkdown, knitr, tikzDevice, xts, ggplot2, gridExtra
2. Execute R file "Main_reproducible_input_data.R" e.g. source("Main_reproducible_MC_outcomes.R", echo = TRUE)
3. Check outputs
3.1. Reproducible rmarkdown report in file "Main_reproducible_MC_outcomes.pdf"
3.2. Individual Figure 05 in file "output/fig05.pdf"

In order to reproduce Figure 06 proceed as follows:

1. If not already installed, install the required R-packages: rmarkdown, knitr, tikzDevice, xts, ggplot2, gridExtra
2. Execute R file "Main_reproducible_input_data.R" e.g. source("Main_reproducible_contributions.R", echo = TRUE)
3. Check outputs
3.1. Reproducible rmarkdown report in file "Main_reproducible_contributions.pdf"
3.2. Individual Figure 06 in file "output/fig06.pdf"
  