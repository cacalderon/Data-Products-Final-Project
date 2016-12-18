
library(shiny)

# Define UI for application that creates prediction algorithm
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Stop Distance [ft] from Speed [mph]"),
  
  # Sidebar with user input 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderSpeed","What is the speed of the car:", min = 2, max = 25, value = 10),
       checkboxInput("ShowModel", "Show/Hide Model", value = TRUE)
        ),
     
    # Show a plot of the data generated
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted distance from model:"),
       textOutput("pred")
     
    )
  )
))
