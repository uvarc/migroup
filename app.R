library(shiny)
library(readr)
library(dplyr)
library(ggplot2)

#setwd('/project/MIGROUP/SDMS/Bi2Te2p7Se0p3/')

df <- read_csv('Data_train_it3.csv')


ui <- fluidPage(
  fluidRow(
    column(4, selectInput('x', 'X', choices = names(df)),
           selectInput('y', 'Y', choices = names(df))),
    column(8, plotOutput('myPlot'))
  ),
  tableOutput('myTable')
)

server <- function(input, output, session) {
  
  output$myPlot <- renderPlot({
    ggplot(df, aes(x = !!as.name(input$x), y = !!as.name(input$y))) + geom_point()
  })
  
  output$myTable <- renderTable({
    df
  })
}

shinyApp(ui, server)
