header <-  dashboardHeader(title = 'Code Test')

sidebar <- dashboardSidebar(
    sidebarMenu(menuItem('Message Submission', tabName = 'submission'),
                menuItem('Message Table', tabName = 'table'),
                menuItem("Git Repository (External Link)",
                         href = "https://github.com/n-howson/code_test/")
    )
)

body <- dashboardBody(
    
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
        tabItem(tabName = "submission",
                h2("Message Submission"),
                textInput('name', 'Name: '),
                textInput('email', 'Email: '),
                textInput('pin', 'PIN: '),
                textAreaInput('message', 'Message: '),
                actionButton('submit', 'Submit')
        ),
        
        tabItem(tabName = "table",
                h2("Message Table"),
                DTOutput('outputTable'),
                downloadButton('summary', 'Download Email Summary')
        )
    )
)


dashboardPage(header, sidebar, body)