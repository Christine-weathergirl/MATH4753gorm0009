
#' Myplot Function
#'
#' @param x variable
#'
#' @return Scatter plot with curved line
#' @export
#'
#' @examples
 dontrun{curve(myplot, lwd=2, col="purple",add=TRUE)}
myplot=function(x){
  0.86089580 +1.46959217*x  -0.02745726*x^2
}
