library(shiny)
library(agridat)
library(dplyr)
data(welch.bermudagrass)
input <- welch.bermudagrass


# Define server logic to do linear regression
shinyServer(function(input, output, session) {
    
    output$ind <- renderUI({
        checkboxGroupInput("ind", "Independent Variables:",names(welch.bermudagrass)[!names(welch.bermudagrass) %in% 'yield'])
    })
    
    buildform <- reactive({paste('yield'," ~ ",paste(input$ind,collapse=" + "))
    })
    
    runRegression <- reactive({
        lm(as.formula(paste('yield'," ~ ",paste(input$ind,collapse=" + "))),data=welch.bermudagrass)
    })
    
    output$formula <- renderText({
        if(!is.null(input$ind)){   
           print(buildform())       
        }
    }) 
    
    output$regTab <- renderTable({
        if(!is.null(input$ind)){
            summary(runRegression())$coefficients
        }
    })
    
    output$plotdiag <- renderPlot({
        if(!is.null(input$ind)){
            par(mfrow = c(2,2))
            plot(runRegression())
        } 
    })
    
})