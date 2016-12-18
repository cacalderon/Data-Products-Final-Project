
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  model<-lm(dist ~ speed, data = cars)
  
  modelpred<-reactive({
    speedInput<-input$sliderSpeed
    predict(model, newdata = data.frame(speed=speedInput))
    })
  
  output$plot1 <- renderPlot({
    speedInput<-input$sliderSpeed
    
    plot(cars$speed, cars$dist, xlab = "Speed [mpgh]", ylab = "Distance [ft]", bty = "n", pch = 16, xlim = c(0,25), ylim = c(2,120))
    if(input$ShowModel){
      abline(model, col = 'red', lwd = 3)
      }
    legend(25,250,c("Model Prediction"), pch = 16, col = 'red', bty='n', cex = 1.2)
    points(speedInput, modelpred(), col = 'blue', pch = 16, cex = 2.5)
    })

  output$pred<-renderText({
    modelpred()
  })
  
  output$slopeout<-renderText({
    model()[[1]][2]
  })
  
    
})
