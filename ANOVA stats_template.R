library(readxl)
library(tidyverse)
library(broom)
library(ggplot2)
all_redox_data_toms_paper <- read_excel("Toms Data/all_redox_data_toms paper.xlsx")
clean_df <- all_redox_data_toms_paper %>%
 
  select(sex,age,gt,tissue,gsh) %>%
  mutate(sex = factor(sex, levels = c(0,1), labels = c("MALE", "FEMALE"), ordered = T),
  age = factor(age, levels = c(0, 1, 2), labels = c("YG", "AD", "OLD"), ordered = T),
  gt = factor(gt, levels = c(0,2), labels = c("WT", "KO"), ordered = T))


  
ad_aov<- aov(gsh ~ sex * age * gt, data = clean_df) 

summary(ad_aov)
tidy_aov<-tidy(ad_aov)

write.csv(tidy_aov,"C:\\Users\\JoeDe\\OneDrive\\Documents\\Toms Data\\aov_liver_gsh.csv")


  
 
 

 
  
  


 
