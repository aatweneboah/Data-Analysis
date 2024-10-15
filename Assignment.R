getwd()

#correct values in the packed cell volume column
main_data <- main_data %>% mutate(
  new_packed_cell_volume = case_when(
    packed_cell_volume == "\t?" ~ NA,
    packed_cell_volume == "\t43" ~ "43",
    .default = packed_cell_volume
  )
) 

#filter unique values in packed cell volume column
x <- select(main_data, packed_cell_volume, new_packed_cell_volume)
filter(x, packed_cell_volume %in% c("\t?","\t43"))
main_data %>% select(packed_cell_volume, new_packed_cell_volume) %>% 
  filter(packed_cell_volume %in% c("\t?","\t43")) 



#correct values in the white blood cell count column
main_data <- main_data %>% mutate(
  new_white_blood_cell_count = case_when(
    white_blood_cell_count == "\t6200" ~ "6200",
    white_blood_cell_count == "\t8400" ~ "8400",
    white_blood_cell_count == "\t?" ~ NA, 
    .default = white_blood_cell_count
  )
) 

#filter unique values in white blood cell count column
y <- select(main_data, white_blood_cell_count, new_white_blood_cell_count)
filter(y, white_blood_cell_count %in% c("\t6200","\t8400","\t?"))
main_data %>% select(white_blood_cell_count, new_white_blood_cell_count) %>% 
  filter(white_blood_cell_count %in% c("\t6200","\t8400","\t?")) 

#correct values in the coronary artery disease column
main_data <- main_data %>% mutate(
  new_coronary_artery_disease = case_when(
    coronary_artery_disease == "\tno" ~ "no",
    .default = coronary_artery_disease
  )
) 

#filter unique values in coronary artery disease
z <- select(main_data, coronary_artery_disease, new_coronary_artery_disease)
filter(z, coronary_artery_disease %in% c("\tno"))
main_data %>% select(coronary_artery_disease, new_coronary_artery_disease) %>% 
  filter(coronary_artery_disease %in% c("\tno")) 

#correct values in the class column
main_data <- main_data %>% mutate(
  new_class = case_when(
    class == "ckd\t" ~ "ckd",
    class == "no,notckd" ~ "notckd",
    .default = class
  )
) 

#filter unique values in class column
m <- select(main_data, class, new_class)
filter(m, class %in% c("ckd\t","no,notckd"))
main_data %>% select(class, new_class) %>% 
  filter(class %in% c("ckd\t","no,notckd"))
