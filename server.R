
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggplot2)
data(mtcars)

fit = lm(mpg~wt, data = mtcars)

shinyServer(function(input, output) {
   
  output$lmPlot <- renderPlot({
    
    mpg_pred = predict(fit, newdata=data.frame(wt=input$wt) )
    # draw the plot
    p=qplot(wt, mpg, data= mtcars)
    #p=p+geom_smooth(mehtod="lm", se=FALSE)
    p=p+geom_abline(intercept = fit$coefficients[1], slope=fit$coefficients[2], colour="red")
    p=p+geom_vline(xintercept=c(input$wt))
    
    p=p+geom_text(data = NULL, x = 5, y = 30, label = paste("wt=",input$wt))
    p=p+geom_text(data = NULL, x = 5, y = 20, label = paste("predicted mpg=", mpg_pred))
    p
    
  })
  
})
