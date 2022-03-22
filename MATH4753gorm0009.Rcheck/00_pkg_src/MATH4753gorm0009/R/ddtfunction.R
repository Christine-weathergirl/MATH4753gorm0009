#' @title ddtfunction
#'
#' @param df data frame
#' @param SPECIES species of fish
#'
#' @return Scatter plot of CCATFISH and SMBAFFULO showing length vs weight.
#' @importFrom magrittr %>%
#' @importFrom dplyr filter
#' @importFrom ggplot2 aes geom_smooth ggplot geom_plot ggtitle
#'
#' @export
#'
#' @examples \dontrun{myddt(df = ddt, SPECIES = "SMBUFFALO")}
#'
library(dplyr)
library(ggplot2)

ddt = read.csv("DDT.csv")


myddt <- function(df, SPECIES){

  tab = table(ddt$RIVER)/length(ddt$RIVER)



  df1 <- df %>% filter(SPECIES == {{SPECIES}})

  if(SPECIES == "CCATFISH"){
    write.csv(df1, "LvsWforCCATFISH.csv", row.names=FALSE)}
  if(SPECIES == "SMBUFFALO"){
    write.csv(df1, "LvsWforSYMBUFFALO.csv", row.names=FALSE)}
  g <- ggplot(df1, aes_string(x="WEIGHT",y="LENGTH")) +
    geom_point(aes_string(col= "RIVER")) +
    geom_smooth(formula = y~x +I(x^2), method = "lm")+ ggtitle("Christine Gormley")
  print(g)}

myddt(df = ddt, SPECIES  = "CCATFISH")

myddt(df = ddt, SPECIES = "SMBUFFALO")
