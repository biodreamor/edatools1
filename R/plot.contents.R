#' @title Visualize a data frame
#'
#' @description
#' \code(plot.contents)
#'
#' @details
#' for each variable ,the plot displays
#' \itemize{
#'   \item(type(\code(numeric),
#'              \code(factor)))
#'   \item(percent of available cases)
#' }
#'
#' @param x
#' an object of class \code(contents)
#'
#' @import ggplot2
#' @importFrom stats reorder
#'
#' @return a \code(ggplot2) graph
#' @seealso see \link(contents).
#' @examples
#' df_info <- contents(happiness)
#' plot(df_info)

plot.contents <- function(x,...){
  if(!inherits(x,"contents"))
    stop("object input error")

  classes <- x$varinfo$type

  pct_n <- 100*(1-x$varinfo$pct_miss)

  df <-data.frame(var=x$varinfo$varname,
                  classes=classes,
                  pct_n=pct_n,
                  classes_n=as.numeric(as.factor(classes)))

  ggplot(df,
         aes(x=reorder(var,classes_n),
             y=pct_n,
             fill=classes))+
    geom_bar(stat="identity")+
    labs(x="",y="percent available",
         title=x$dfname,
         caption=paste(x$nrow,"cases",
                       x$ncol,"variables"),
         fill="type")+
    guides(fill=guide_legend(reverse=TRUE))+
    scale_y_continuous(breaks=seq(0,100,20))+
    coord_flip()+
    theme_minimal()
}
