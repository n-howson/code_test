server <- function(input, output, session) {
  
  observeEvent(input$submit, {
    rv$data <- rbind(rv$data, data.table(Name = input$name, 
                                         Email = input$email,
                                         PIN = input$pin,
                                         Message = input$message))
    updateTextInput(session, 'name', value = '')
    updateTextInput(session, 'email', value = '')
    updateTextInput(session, 'pin', value = '')
    updateTextAreaInput(session, 'message', value = '')
    
    fwrite(rv$data, 'data/dataTable.csv')
  })
  
  output$outputTable <- renderDataTable(rv$data)
  
  output$summary <- downloadHandler(
    filename = function() {
      'code_test_export.csv'
    },
    content = function(file) {
      write.csv(
        rv$data[, .(`Message Count` = .N), by = Email]
        , file, row.names = FALSE)
    }
  )
}