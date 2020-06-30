# stacked line plot (final paper HESS)
# author: J.A. Torres-Matallana
# organization: Luxembourg Institute of Science and Technology (LIST), Luxembourg
#               Wagenigen University and Research Centre (WUR), Wageningen, The Netherlands   
# date: 17.06.2016 - 25.04.2020

##===========================================================================================
## plot it! stacked line plot
##===========================================================================================
library(ggplot2)
library(xts)

Plot.stacked1 <- function(data.bar, time.plot.ini, time.plot.end, breaks.by, xlab, ylab){
  data.bar.xts <- xts(data.bar, order.by = data.bar$time)
  y.max <- max(as.numeric(data.bar[paste0(time.plot.ini, "/", time.plot.end), "value"]))
  
  breaks <- seq.POSIXt(from = time.plot.ini, by = breaks.by, to = time.plot.end)
  breaks.minor <- seq.POSIXt(from = time.plot.ini, by = 60*60*1, to = time.plot.end)
  labels <- format(breaks-60*60*2, "%b %d %H:%M")
  # labels <- format(breaks, "%b %d %H:%M")
  xlim <- c(time.plot.ini, time.plot.end)
  
  plot.c <- ggplot(data.bar) +
    theme_bw() +
    geom_area(aes(x=as.POSIXct(time), y=value, fill=variable), stat='identity') +
    scale_fill_brewer(palette="Spectral", direction = 1) +
    scale_colour_manual(name="variable") +
    scale_x_datetime(name = xlab, breaks = breaks, labels = labels, limits = xlim,
                     minor_breaks = breaks.minor) +
    ylim(c(0, y.max)) +
    theme(plot.margin = unit(c(1,12,5,6), units="points"),
          axis.text.x = element_text(angle = 90, vjust = 0.5,  hjust = 0),
          text = element_text(size=22),
          legend.position = c(.95, .95),
          legend.justification = c("right", "top"),
          legend.box.just = "right",
          legend.margin = margin(6, 6, 6, 6)) +
    labs(y = ylab, x = xlab)

  return(plot.c)
}

