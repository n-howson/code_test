server <- function(input, output, session) {
  
  observeEvent(input$submit, {
    rv$data <- rbind(rv$data, data.table(Time = format_iso_8601(Sys.time()),
                                         Name = input$name, 
                                         Message = input$message,
                                         PIN = input$pin,
                                         Email = input$email))
    updateTextInput(session, 'name', value = '')
    updateTextInput(session, 'email', value = '')
    updateTextInput(session, 'pin', value = '')
    updateTextAreaInput(session, 'message', value = '')
    
    fwrite(rv$data, 'dataTable.csv')
  })
  
  output$outputTable <- renderDT(
    DT::datatable(rv$data[, .(Time, Name, Message)])
    )
  
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