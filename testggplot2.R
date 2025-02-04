########### prise en main - exercise ##############
###installation du package ggplot 2
#install.packages("ggplot2")
library(ggplot2)

##
# Visualisation de la structure du jeu de données

data(diamonds)
head(diamonds)
names(diamonds) 

summary(diamonds) # Résumé statistique des variables
 
ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 500, fill = "steelblue", color = "lightpink", alpha = 0.5) +
  labs(title = "Distribution du prix des diamants", x = "prix", y = "nombre de diamants") +
  theme_void()


#évolution du prix en fonction du carat
ggplot(data=diamonds, mapping= aes(x=price, y= carat, color = color))+  
  geom_point(alpha=0.5, size=5)+
  scale_color_brewer(palette = "Set1")+
  geom_smooth( method=lm , color = "yellow") +
  theme_dark()+
  labs(title = "Prix des diamants en fonction du poids (carat)",
       x="Prix (en Euro)", y="Poid (en carat)")


#Histogramme du prix en fonction de la couleur
ggplot(diamonds, aes(x = price, fill = color)) +
  geom_histogram(binwidth = 250, alpha = 0.7, position = "identity", color = "pink") +
  facet_wrap(~ color) +
  labs(title = "Prix des diamants en fonction de la couleur", x = "prix", y = "nombre de diamants") +
  theme_minimal()



