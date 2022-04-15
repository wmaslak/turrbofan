load_data <- function(here_call = ""){
  i_am(here_call)
  path_train <- here("data/selected_data/train")
  path_test <- here("data/selected_data/test")
  # read constant sensors
  

  # load train and test data
  for (path in c(path_train,path_test)) {
    
    for(file in list.files(path)){
      
      df <- readRDS(paste0(path,'/',file))
      df_no <- grep("[0-9]",file)
      cs<- readRDS(here(paste0("objects/constant_sensors_data",df_no,".rds")))
      df <- df %>% select(-one_of(cs))
      
      name <- gsub(".Rds",'',file)
      assign(name,df,envir = globalenv())
      
    }
    
  }

 
}

