############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 15/11/2024 
## Auteur : ....

##########################################################################
########################### Fonction utiles ##############################
##########################################################################

library(tidyverse)

#install.packages("readxl")
library("readxl")
library(tidyr)

#%>% 
#|> 
#read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...


##########################################################################
########################### Import #######################################
##########################################################################

Sites <- read_excel("Sites.xlsx")
Microorga <- read_excel("Microorganismes.xlsx")
Nematodes <- read_excel("Nematodes.xlsx")
Vers <- read_excel("Lombrics.xlsx")

left_join() #conserve tous les enregistrements du tableaux de gauche
inner_join() #seulement les enregistrements qui concorde
right_join() #conserve tous les enregistrements du tableau de droite


##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communauté biologique ###########

SitesMicro <- inner_join(Sites, Microorga, join_by(ID) ) 

#écriture tidyverse
Sites %>% inner_join(. ,Microorga, join_by(ID)) -> SitesMicro

SitesMicro

##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########

SitesMicro %>%
filter (SITE == "Feucherolles") %>%
  select(SITE:REPET_BLOC,ARGILE,
         contains("SABLE"),
         contains("LIMON"),
         ends_with("MIN")

         ) -> feMicro 
#selectionne toutes les colonnes après argile

feMicro




##########################################################################
####################### Créer des variables ##################
##########################################################################

#mutate() 
#??mutate

feMicro %>%
  mutate( PSableF = (SABLE_F/(SABLE_F+SABLE_G )*100) ) -> FeMicro_SLF


##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps######
FeMicro_SLF %>% 
  group_by(Modalite) %>%
  summarise( mean_sablef= mean(PSableF), sd_sablef=sd(PSableF) )
  

##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités

ggplot(data=)

##########################################################################
######################## Pivots ##########################################
##########################################################################
#pivot longer => mettre des colonnes qui se "ressemblent" avec la même unité 
#intéressant de les mettre dans une même colonne 


FeMicro_SLF_P1 <- pivot_longer(FeMicro_SLF, cols= starts_with("LIMON_"), values_to = "amount", names_to = "LIMON TOT")

 ##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

