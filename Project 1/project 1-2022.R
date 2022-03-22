# functions that call dplyr and ggplot2.
# this is not obvious because of non standard evaluation
library(dplyr)
library(ggplot2)

myfunNSE <- function(df,cond){
  
  df %>% filter({{cond}}) # Note the use of {{}}
}

library(Intro2R)
myfunNSE(ddt, cond = LENGTH > 40)

myfun2NSE <- function(df, x, y, cond, col){
  
  df1 <- df %>% filter({{cond}}) # Note the use of {{}}
  g <- ggplot(df1, aes_string(x=x,y=y)) + # Note the use of aes_string 
    geom_point(aes_string(color = col )) +
    geom_smooth(formula = y~x +I(x^2), method = "lm")
  print(g)
  head(df1)
  
}

myfun2NSE(df = ddt, x = "LENGTH", y= "WEIGHT",cond = LENGTH > 30, col = "SPECIES")
