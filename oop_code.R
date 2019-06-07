library(dplyr)
library(magrittr)
library(tidyr)

make_LD <- function(dataframe){
  structure(dataframe, class = "LongitudinalData")
}

subject <- function(dataframe , subject_id) UseMethod("subject")
subject.LongitudinalData <- function(dataframe , subject_id){
  class(dataframe) <- "data.frame"
  sub_data <- dataframe %>% filter(id == subject_id)
  if(length(sub_data$id) == 0){
    return(NULL)
  }
  else {
    structure(list(id = sub_data$id[1] ,
                   Sub_obj = sub_data), 
              class = "Subject")
  }
}
 
visit <- function(Subject, visit_id) UseMethod("visit")
visit.Subject <- function(Subject, visit_id){
  class(Subject) <- "data.frame"
  Visit <- Subject$Sub_obj %>%
    filter(visit == visit_id)
    structure(list(Subject = Subject, 
                   visit = Visit,
                   visit_id = visit_id),
              class = "Visit")
}
room <- function(Visit, room_name) UseMethod("room")
room.Visit <- function(Visit, room_name){
  class(Visit) <- "data.frame"
  Room <- Visit$visit %>%
    filter(room == room_name)
    structure(list(Visit = Visit,
                   room = Room,
                   room_name = room_name
    ),
    class = "Room")
}
#summary methods for each class
summary.Subject <- function(Subject){
  class(Subject) <- "data.frame"
  Sum_obj <- Subject$Sub_obj %>%
    group_by(visit,room) %>%
    select(visit, room, value) %>%
    summarise(value = mean(value)) %>%
    spread(room , value)
  structure(list(id = Subject$id,
                 Sum_obj = Sum_obj),
            class = "Summary")
}
summary.Room <- function(Room_obj){
  class(Room_obj) <- "data.frame"
  Sum_obj <- Room_obj$room$value %>% summary
  structure(list(id = Room_obj$room$id[1],
                 Sum_obj = Sum_obj),
            class = "Summary")
}

#Print methods for each class
print.LongitudinalData <- function(dataframe){
  paste("Longitudinal dataset with", length(unique(dataframe$id)), "subjects")
} 
print.Subject <- function(Sub_obj){
  if(length(Sub_obj$id > 0)){
    paste("Subject ID:", Sub_obj$id)
  }
  else { return(NULL) }
}
print.Room <- function(Room_obj){
  print(paste("ID:", Room_obj$Visit$Subject$id))
  print(paste("Visit:", Room_obj$Visit$visit_id))
  print(paste("Room:", Room_obj$room_name))
}
print.Summary <- function(Sum_obj){
  print(paste("ID:",Sum_obj$id))
  print(Sum_obj$Sum_obj)
}
