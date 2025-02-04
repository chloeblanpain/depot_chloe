########### prise en main - exercise ##############
###installation du package ggplot 2
#install.packages("ggplot2")
library(ggplot2)

##

data(diamonds)
head(diamonds)

 
#évolution du prix en fonction du carat
ggplot(data=diamonds, mapping= aes(x=price, y= carat, color = color))+  
  geom_point()+
  geom_smooth( method=lm , color = "yellow") +
  theme_dark()+
  labs(title = "Prix des diamants en fonction du Carat",
       x="Prix (en Euro)", y="Carat",
       subtitle = "les diamants, c'est cher")



