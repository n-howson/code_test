library(shiny)
library(shinyjs)
library(shinydashboard)
library(shinyWidgets)
library(data.table)

if(file.exists('data/dataTable.csv')){
  messageList <- fread('data/dataTable.csv',
                       colClasses = c('character', 'character', 
                                      'character', 'character'))
} else {
  messageList <- data.table(Name = character(), 
                            Email = character(), 
                            PIN = character(), 
                            Message = character())
}

rv <- reactiveValues(data = messageList)