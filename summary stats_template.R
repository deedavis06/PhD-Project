
library(readxl)
library(tidyverse)
library(broom)
library(ggplot2)
all_redox_data_toms_paper <- read_excel("Toms Data/all_redox_data_toms paper.xlsx")
clean_df <- all_redox_data_toms_paper %>%
  filter(gt%in% c(0,2) & tissue == "Liver") %>%
  select(sex,age,gt,tissue,gsh) %>%
  mutate(sex = factor(sex, levels = c(0,1), labels = c("Male", "Female"), ordered = T),
  age = factor(age, levels = c(0, 1, 2), labels = c("5 Month", "10 Month", "20 Month"), ordered = T),
  gt = factor(gt, levels = c(0,2), labels = c("GCLM+/+", "GCLM-/-"), ordered = T))
  


clean_df <- clean_df %>%
  group_by(sex, age, gt) %>%
  summarize(gsh_mean = mean(gsh), 
            gsh_se = sd(gsh)/sqrt(n()), 
            n_samples = n()) %>%

ungroup()


write.csv(clean_df, "C:\\Users\\JoeDe\\OneDrive\\Documents\\Toms Data\\summary stats_liver_gsh.csv")
 
  
  


 
