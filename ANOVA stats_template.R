#running 3-way ANOVAs using sex, age and genotype as independent variables for glutathione levels in the liver
library(readxl)
library(tidyverse)
library(broom)
library(ggplot2)
all_redox_data <- read_excel("Data/all_redox_data.xlsx")
clean_df <- all_redox_data %>%
 
  select(sex,age,gt,tissue,gsh) %>%
  mutate(sex = factor(sex, levels = c(0,1), labels = c("MALE", "FEMALE"), ordered = T),
  age = factor(age, levels = c(0, 1, 2), labels = c("YG", "AD", "OLD"), ordered = T),
  gt = factor(gt, levels = c(0,2), labels = c("WT", "KO"), ordered = T))


  
ad_aov<- aov(gsh ~ sex * age * gt, data = clean_df) 

summary(ad_aov)
tidy_aov<-tidy(ad_aov)

write.csv(tidy_aov,"C:\\Documents\\Data\\aov_liver_gsh.csv")


  
 
 

 
  
  


 
