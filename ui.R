
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Simple Linear Model to estimate a car's mpg based on mtcars data."),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    sliderInput("wt",
                "Select weight (1000 lbs): ",
                min = 1,
                max = 6,
                value = 3,
                step = 0.01),
    h4("Select the weigtht on sliderbar above."), 
    h4("The predicted mpg is the intersection of red line and vertical line.")
  ),
  
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("lmPlot")
  )
))
