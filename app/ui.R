header <-  dashboardHeader(title = 'Code Test')

sidebar <- dashboardSidebar(
    sidebarMenu(menuItem('Message Submission', tabName = 'submission', icon = icon('sign-in-alt')),
                menuItem('Message Table', tabName = 'table', icon = icon('table'))
    )
)

body <- dashboardBody(
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
                downloadButton('summary', 'Download Email summary')
        )
    )
)


dashboardPage(header, sidebar, body)