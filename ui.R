library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Estimated Yield of Bermuda Grass"),
    
    sidebarPanel(
        p("Choose factors to include as independent variables in model."),
        uiOutput("ind"),
        br(),
        a("Link to Github Repo", href = "https://github.com/")
    ),
    
    mainPanel(
        p('This app allows the user to build a linear regression model to predict yield of Bermuda Grass dependent on inputs of fertilizer, including nitrogen(n), phosphorus(p), and potassium(k). The data comes from field level data gathering performed in the 1950s and included in the agridat libarary on CRAN.'),
        br(),
        p('Choose one or more input variables on the side panel. These variables will then be used to perform a linear regression on crop yield on Bermuda Grass Fields. The output includes a formula of the linear model, a table of coefficients, and diagnostics plots.'),
        br(),
        strong("Formula"),
        textOutput("formula"),
        br(),
        strong("Coefficients"),
        tableOutput("regTab"),
        br(),
        strong("Diagnostic Plots"),
        plotOutput("plotdiag")
    )
))


