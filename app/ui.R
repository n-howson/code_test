dashboardPage(
    dashboardHeader(title = 'Code Test'),
    dashboardSidebar(
        menuItem('Message Submission', tabName = 'submission', icon = icon('sign-in-alt')),
        menuItem('Message Table', tabName = 'table', icon = icon('table')),
        menuItem("Git Repository", icon = icon("github-square"), 
                 href = "https://github.com/n-howson/code_test")
    ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "submission",
                    h2("Message Submission")
            ),
            
            tabItem(tabName = "table",
                    h2("Message Table")
            )
        )
    )
)