library(shiny)
library(shinyjs)
library(shinydashboard)
library(shinyWidgets)
library(data.table)
library(DT)
library(parsedate)

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

rv <- reactiveValues(data = messageList)