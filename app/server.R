server <- function(input, output, session) { # Function call to create server object.
 
# Input Submission Event ------------------------------------------------------   
  observeEvent(input$submit, {
    # Append submitted data to existing data.
    rv$data <- rbind(rv$data, data.table(Time = format_iso_8601(Sys.time()),
                                         Name = input$name, 
                                         Message = input$message,
                                         PIN = input$pin,
                                         Email = input$email))
    
    # Clear input fields.
    updateTextInput(session, 'name', value = '')
    updateTextInput(session, 'email', value = '')
    updateTextInput(session, 'pin', value = '')
    updateTextAreaInput(session, 'message', value = '')
    
    # Write new data table.
    fwrite(rv$data, 'dataTable.csv')
  })
  
# Data Table Display ----------------------------------------------------------
    output$outputTable <- renderDT(
    DT::datatable(
      rv$data[, .(Time, Name, Message)] # Select only the relevant columns.
      )
    )
  
# Unique Email Message Count --------------------------------------------------
  output$summary <- downloadHandler(
    # Name file for download.
    filename = function() {
      'code_test_export.csv' 
    },
    # Generate file.
    content = function(file) {
      write.csv( # Use write.csv in this case, more stable than fwrite within a downloadHandler.
        rv$data[, .(`Message Count` = .N), by = Email] # Complete summarisation step. 
        , file, row.names = FALSE) # No indices for rows.
    }
  )
}