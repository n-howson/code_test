# Package read in. ------------------------------------------------------------

library(shiny) # Required for Shiny.
library(shinydashboard) # Extends Shiny to more attractive UI.
library(data.table) # Allows for better performance than dplyr/tidyverse/base for summary of data.
library(DT) # Allows for better display of data tables.
library(parsedate) # Enables easy ISO-8601 display.


# Data initialisation ---------------------------------------------------------

# Check if messages already exist, if so, read in existing messages
# if not, create empty data table.
if(file.exists('dataTable.csv')){
  messageList <- fread('dataTable.csv',
                       colClasses = c('character', 'character', 
                                      'character', 'character',
                                      'character'))
} else {
  messageList <- data.table(Time = character(), 
                            Name = character(), 
                            Message = character(),
                            PIN = character(),
                            Email = character())
}

# Make initial data reactive.
rv <- reactiveValues(data = messageList)