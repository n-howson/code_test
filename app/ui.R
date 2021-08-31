# Header. ---------------------------------------------------------------------
header <-  dashboardHeader(title = 'Code Test') # Create header with dashboard title.

# Sidebar. --------------------------------------------------------------------
sidebar <- dashboardSidebar(
    # Create selectable menu tabs, as well as link to git repository
    sidebarMenu(menuItem('Message Submission', tabName = 'submission'),
                menuItem('Message Table', tabName = 'table'),
                menuItem("Git Repository (External Link)",
                         href = "https://github.com/n-howson/code_test/")
    )
)

# Body ------------------------------------------------------------------------
body <- dashboardBody(
    
    # Implement corporate, more stylish colours on dashboard. -----------------
    tags$head(tags$style(HTML('

                            /* title */

                            .skin-blue .main-header .logo {

                            background-color: #1c355e;

                            font-size: 15px;

                            }

                           

                            /* title when hovered */

                            .skin-blue .main-header .logo:hover {

                            background-color: #1c355e;

                            }

                            

                            /* navbar (rest of the header) */

                            .skin-blue .main-header .navbar {

                            background-color: #1c355e;

                            }       

                            

                            /* main sidebar */

                            .skin-blue .main-sidebar {

                            background-color: #8f1f1a;

                            }

                           

                            /* active selected tab in the sidebarmenu */

                            .skin-blue .main-sidebar .sidebar .sidebar-menu .active a:hover,

                            .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{

                            background-color: #ff271c;

                            }

                           

                            /* other links in the sidebarmenu when hovered */

                            .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{

                            background-color: #d93e36;

                            }

                            '))),
    
    tabItems(

# Submissions Page ------------------------------------------------------------
        tabItem(tabName = "submission",
                h2("Message Submission"), # Page header.
                textInput('name', 'Name: '), # Name input.
                textInput('email', 'Email: '), # Name input.
                textInput('pin', 'PIN: '), # Name input. Could upgrade to passwordInput.
                textAreaInput('message', 'Message: '), # Message input, textAreaInput enables more readable text entry.
                actionButton('submit', 'Submit') # Submit button that kicks off write to data table and clears text (see server.R).
        ),

# Message List Page -----------------------------------------------------------        
        tabItem(tabName = "table",
                h2("Message Table"), # Page header.
                DTOutput('outputTable'), # Message list table.
                downloadButton('summary', 'Download Email Summary') # Download button for Unique Email message count.
        )
    )
)


dashboardPage(header, sidebar, body) # Brings together above code to full UI layout.