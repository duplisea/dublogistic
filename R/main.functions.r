#' A double logistic selectivity function
#'
#' @param L a length or length vector for which you want a selectivity estimates
#' @param inflection1 the inflection point of the first part of the selectivity curve
#' @param inflection2 the inflection point of the second part of the selectivity curve
#' @param slope1 the slope of the first part of the curve
#' @param slope2 the slope of the second part of the curve
#' @param max.sel the maximum selectivity level
#' @param minsel.upper the asymptotic minimum selectivity on the right side of the curve. Dome shaped curves between 0 and max.sel, =max.sel for a regular logistic curve
#' @param plot T if you want a plot of the curve
#' @description This is a useful function because it can not only mimic standard sigmoidal selectivity but also
#'         a dome shaped selectivity curve if necessary. Set minsell.upper=max.sel for a simple logisitic curve. 
#'         A default parameterisation is provided simply to give you something to start with that might seem half
#'         decent.
#' @export
dublogistic.f= function(L,inflection1=38, inflection2=90, slope1=.3, slope2=.1, max.sel=1, minsel.upper=.4, plot=F){
  minsel.upper= 1-minsel.upper
  logistic1= max.sel/(1+exp(-slope1*(L-inflection1)))
  logistic2= 1-minsel.upper/(1+exp(-slope2*(L-inflection2)))
  sel= logistic1*logistic2
  selectivity= data.frame(Length=L,selectivity=sel)
  if(plot){
    plot(L,sel,type="l",lwd=2,xlab="Length",ylab="Selectivity")
  }
  selectivity
}
